#include <elf/elf.h>
#include <hypercalls/hp_read.h>
#include <mm/kmalloc.h>
#include <mm/mmap.h>
#include <mm/translate.h>
#include <mm/uaccess.h>
#include <syscalls/sys_close.h>
#include <syscalls/sys_execve.h>
#include <syscalls/sys_mmap.h>
#include <syscalls/sys_open.h>
#include <utils/errno.h>
#include <utils/misc.h>
#include <utils/string.h>

// Load the ELF to the VM
static int load_binary(int fd, process *p) {
  void *buf = kmalloc(0x1000, MALLOC_NO_ALIGN);
  hp_read(fd, physical(buf), 0x1000);
  Elf64_Ehdr *ehdr = (Elf64_Ehdr *)buf;

  // Validate the magic number plus flags for 64-bit, little-endian, System V
  // ABI. R
  if (memcmp(ehdr->e_ident, "\177ELF\x02\x01\x01\0\0\0\0\0\0\0\0\0", 16) != 0)
    return -ENOEXEC;

  p->entry = ehdr->e_entry;
  p->load_addr = 0;

  // Only allow executable (old-style binaries) and shared object types (modern
  // binaries like gcc default)
  if (ehdr->e_type != ET_EXEC && ehdr->e_type != ET_DYN)
    return -ENOEXEC;

  // Fixed based address simulating Address Space Layout Randomization (ASLR)
  // We load ET_EXEC at 0x0 (fixed) and ET_DYN at 0x0000555555554000
  // to avoid conflicts
  if (ehdr->e_type == ET_DYN)
    p->load_addr = 0x0000555555554000ull;

  // Metaheader should end here
  if (ehdr->e_phoff != sizeof(*ehdr))
    return -EINVAL;
  if (ehdr->e_phentsize != sizeof(Elf64_Phdr))
    return -EINVAL;

  // Check total size of program headers (64 bytes only)
  if (ehdr->e_phoff + (uint64_t)ehdr->e_phentsize * ehdr->e_phnum > 0x1000)
    return -EINVAL;

  // Get the start of program header section
  Elf64_Phdr *phdr = (Elf64_Phdr *)((uint8_t *)buf + ehdr->e_phoff);

  // Loop through loadable/program segments
  for (int i = 0; i < ehdr->e_phnum; i++, phdr++) {
    if (phdr->p_type == PT_LOAD) {
      // Align start and end address of a segment
      uint64_t sz = phdr->p_filesz;
      uint64_t st = p->load_addr + aligndown(phdr->p_vaddr),
               ed = p->load_addr + alignup(phdr->p_vaddr + sz);

      // Convert ELF flags (describe program intents) to memory protection bits
      // (R/W/X, CPU/MMU specific) Example: PF_W = 1 to PROT_WRITE = 2 Why do
      // this? -> ELF is the standard but CPU protection mechanisms vary so this
      // is an abstraction
      int prot = pf_to_prot(phdr->p_flags);

      // not a good idea to allocate extra memory to handle misalignment,
      // but it works (good idea is to handle partial page)
      // map file segment into process memory
      void *r =
          sys_mmap((void *)st,
                   // Extra space for misalignment (why? how?)
                   sz + (phdr->p_offset & 0xfff), prot,
                   MAP_FIXED, // Place at the EXACT address
                   fd,
                   phdr->p_offset &
                       -0x1000 // Start reading from page-aligned file offset
          );

      // Treat error pointer as signed 64-bit
      // and truncate to 32 bit as standard error code size
      if (r != (void *)st)
        return (int)(int64_t)r;

      if (phdr->p_memsz > sz) {
        // BSS section (uninitialzed data?)
        uint64_t bss_ed = p->load_addr + alignup(phdr->p_vaddr + phdr->p_memsz);
        if (bss_ed != ed) {
          if (mmap((void *)ed, bss_ed - ed, prot) != (void *)ed)
            return -ENOMEM;
        }
      }
    }
  }

  // Set up stack
  p->stack_base = 0x00007ffffffff000ull;
  p->stack_size = 0x40000; // 26 MiB?
  p->rsp = p->stack_base - 0x1000;
  void *st = (void *)(p->stack_base - p->stack_size);

  // Allocate stack memory with read/write permission (add R/W to every byte?)
  if (mmap(st, p->stack_size, PROT_RW) != st)
    return -ENOMEM;
  return 0;
}

// Check permissions of args and return counts
static int check_and_get_count(char *const arr[]) {
  // Array decays to a pointer when being passed to a function
  if (!access_ok(VERIFY_READ, arr, 8))
    return -EFAULT;
  int i = 0;
  while (*arr != 0) {
    if (!access_string_ok(*arr))
      return -EFAULT;
    // Also used as a cursor
    ++arr; // Move to point to argv[i]
    ++i;
    if (!access_ok(VERIFY_READ, arr, 8))
      return -EFAULT;
  }
  return i;
}

// Track the stack pointer cursor
// Stack growing downwards??
#define STACK_ALLOC(sp, len)                                                   \
  ({                                                                           \
    sp -= len;                                                                 \
    (uint64_t *)sp;                                                            \
  })
// Why?? rsp alignment by
#define ROUNDDOWN(sp) sp &= -0x10

/*
 Genenrate ELF info of user program bin
 Stack should look like this at the end

 Higher address
          ┌─────────────────────────┐
          │      argc (3)           │  ← rsp points here
          ├─────────────────────────┤
          │  argv[0] (ptr to prog)  │
          ├─────────────────────────┤
          │  argv[1] (ptr to arg1)  │
          ├─────────────────────────┤
          │  argv[2] (ptr to arg2)  │
          ├─────────────────────────┤
          │      NULL (argv term)   │
          ├─────────────────────────┤
          │ envp[0] (ptr to PATH)   │
          ├─────────────────────────┤
          │ envp[1] (ptr to HOME)   │
          ├─────────────────────────┤
          │      NULL (envp term)   │
          ├─────────────────────────┤
          │   "program name\0"      │
          │   "arg1\0"              │
          │   "arg2\0"              │
          │   "PATH=.../bin\0"      │
          │   "HOME=/home/user\0"   │
          └─────────────────────────┘
 Lower Address (heap grows upward from here)

 * */
static int create_elf_info(process *p, char *const argv[], char *const envp[]) {
  // Push strings first (why?)
  int argc = check_and_get_count(argv);
  if (argc < 0)
    return argc;
  int envc = check_and_get_count(envp);
  if (envc < 0)
    return envc;

  // +2 for NULL terminators
  char **copy =
      (char **)kmalloc((argc + envc + 2) * sizeof(char *), MALLOC_NO_ALIGN);
  // Push envp in reverse order
  for (int i = envc - 1; i >= 0; i--) {
    uint64_t len = strlen(argv[i]) + 1;
    // +1 leaves room for NULL
    copy[argc + 1 + i] = (char *)STACK_ALLOC(p->rsp, len);
    memcpy(copy[argc + 1 + i], envp[i], len);
  }

  // Push argv in reverse order
  for (int i = argc - 1; i >= 0; i--) {
    uint64_t len = strlen(argv[i]) + 1;
    copy[i] = (char *)STACK_ALLOC(p->rsp, len);
    memcpy(copy[i], argv[i], len);
  }

  // Program is happier is rsp is aligned -> Goal?
  // Final rsp is 16-byte aligned
  // so we calculate bytes to be copied -> round the rsp
  ROUNDDOWN(p->rsp);

  // If total count of pointers is odd, push extra 8 bytes for 16-byte alignment
  if ((argc + 1 + envc + 1 + 1) & 1)
    STACK_ALLOC(p->rsp, 8);

  // Push envp and argv onto stack
  for (int i = argc + envc + 1; i >= 0; i--)
    *(char **)STACK_ALLOC(p->rsp, 8) = copy[i];

  kfree(copy);

  // Push argc to stack
  *(uint64_t *)STACK_ALLOC(p->rsp, 8) = argc;

  return 0;
}

// User program executes guest kernel syscalls
int sys_execve(const char *path, char *const argv[], char *const envp[]) {
  int fd = sys_open(path);
  if (fd < 0)
    return fd; // Error?

  process p;

  int ret = load_binary(fd, &p);
  if (ret < 0)
    return ret;
  sys_close(fd);

  // Build the stack image for the new process (why need?)
  // by copying argv and envp to the new mapped user stack
  if (create_elf_info(&p, argv, envp))
    return -EFAULT;

  // This is an execve call so we can ignore saved registries like rip and rsp
  // (why???)
  asm volatile(
      // volatile means running this exactly where this block appears without
      // optimization
      "mov [rip + kernel_stack], rsp;" // Init rsp?
      "mov rcx, %[entry];"             // rip?
      "mov r11, 0x2;"                  // rflags?
      "mov rsp, %[rsp];"
      // Clean up registers (why?)

      "xor rax, rax;"
      "xor rbx, rbx;"
      "xor rdx, rdx;"
      "xor rdi, rdi;"
      "xor rsi, rsi;"
      "xor rbp, rbp;"
      "xor r8, r8;"
      "xor r9, r9;"
      "xor r10, r10;"
      "xor r12, r12;"
      "xor r13, r13;"
      "xor r14, r14;"
      "xor r15, r15;"
      "xor rbp, rbp;"
      ".byte 0x48;"
      // Move from ring 0 to ring 3
      "sysretq"
      // GCC extended-asm operand syntax: "template" : outputs : inputs :
      // clobbers
      ::[entry] "r"(p.entry + p.load_addr),
      [rsp] "r"(p.rsp)
      : "r11", "rcx");

  // never reached (why?)
  return -EPERM;
}
