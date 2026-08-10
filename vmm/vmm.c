#include <asm/kvm.h>
#include <fcntl.h>
#include <linux/kvm.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>

#include "debug.h"
#include "definition.h"
#include "hypercall.h"

// Start of free memory
#define PS_LIMIT (0x200000)
// 16 KiB space reserved for kernel stack
#define KERNEL_STACK_SIZE (0x4000)
// 20 KiB for all page tables?
#define PAGE_TABLE_SIZE (0x5000)
// Kernel starts at this address
#define MAX_KERNEL_SIZE (PS_LIMIT - PAGE_TABLE_SIZE - KERNEL_STACK_SIZE)
// 4 MiB memory for the VM
#define MEM_SIZE (PS_LIMIT * 0x2)

// Read the content of the file as stream
void read_file(const char *filename, uint8_t **content_ptr, size_t *size_ptr) {
  FILE *f = fopen(filename, "rb");
  if (f == NULL)
    error("Open file '%s' failed.\n", filename);
  if (fseek(f, 0, SEEK_END) < 0)
    pexit("fseek(SEEK_END)");

  size_t size = ftell(f);
  if (size == 0)
    error("Empty file '%s'. \n", filename);
  if (fseek(f, 0, SEEK_SET) < 0)
    pexit("fseek(SEEK_SET)");

  uint8_t *content = (uint8_t *)malloc(size);
  if (content == NULL)
    error("read_file: Cannot allocate memory\n");
  if (fread(content, 1, size, f) != size)
    error("read_file: Unexpected EOF\n");

  fclose(f);
  *content_ptr = content;
  *size_ptr = size;
}

void setup_paging(VM *vm) {
  struct kvm_sregs sregs;
  if (ioctl(vm->vcpufd, KVM_GET_SREGS, &sregs) < 0)
    pexit("ioctl(KVM_GET_SREGS)");

  // At the start of space reserved for kernel?
  uint64_t pml4_addr = MAX_KERNEL_SIZE;
  uint64_t *pml4 = (void *)(vm->mem + pml4_addr);

  // Each table is 4MB
  uint64_t pdp_addr = pml4_addr + 0x1000;
  uint64_t *pdp = (void *)(vm->mem + pdp_addr);

  uint64_t pd_addr = pdp_addr + 0x1000;
  uint64_t *pd = (void *)(vm->mem + pd_addr);

  pml4[0] = PDE64_PRESENT | PDE64_RW | PDE64_USER | pdp_addr;
  pdp[0] = PDE64_PRESENT | PDE64_RW | PDE64_USER | pd_addr;
  pd[0] = PDE64_PRESENT | PDE64_RW | PDE64_PS; /* kernel only, no PED64_USER */

  sregs.cr3 = pml4_addr;
  sregs.cr4 = CR4_PAE;
  // Enable SSE (Streaming SIMD Extension) instruction
  sregs.cr4 |= CR4_OSFXSR | CR4_OSXMMEXCPT;

  sregs.cr0 = CR0_PE | CR0_MP | CR0_ET | CR0_NE | CR0_WP | CR0_AM | CR0_PG;

  sregs.efer = EFER_LME | EFER_LMA;
  sregs.efer |= EFER_SCE;

  if (ioctl(vm->vcpufd, KVM_SET_SREGS, &sregs) < 0)
    pexit("ioctl(KVM_SET_SREGS");
}

void setup_seg_regs(VM *vm) {
  struct kvm_sregs sregs;
  if (ioctl(vm->vcpufd, KVM_GET_SREGS, &sregs) < 0)
    pexit("ioctl(KVM_SET_SREGS");

  // Configure code segment (index 1)
  struct kvm_segment seg = {
      .base = 0,
      .limit = 0xffffffff,
      .selector = 1 << 3,
      .present = 1,
      .type = 0xb,
      .dpl = 0, // Kernel mode
      .db = 0,
      .s = 1,
      .l = 1, // Long mode
      .g = 1  // 4 KByte granularity
              // TODO: No avl?
  };
  sregs.cs = seg;

  // Configure data segment
  seg.type = 0x3;
  seg.selector = 2 << 3;
  sregs.ds = sregs.es = sregs.fs = sregs.gs = sregs.ss = seg;
  if (ioctl(vm->vcpufd, KVM_SET_SREGS, &sregs) < 0)
    pexit("ioctl(KVM_SET_SREGS)");
}

void setup_long_mode(VM *vm) {
  setup_paging(vm);
  setup_seg_regs(vm);
}

// Guest physical memory
//
// 0x000000 ┌──────────────────────────────┐
//          │ kernel image                 │
// 0x1f7000 ├──────────────────────────────┤
//          │ page tables, 0x5000 bytes    │
// 0x1fc000 ├──────────────────────────────┤
//          │ kernel stack, 0x4000 bytes   │
// 0x200000 ├──────────────────────────────┤ ← PS_LIMIT, start of free memory
//          │ free physical memory         │
// 0x400000 └──────────────────────────────┘ ← MEM_SIZE (limit)
void setup_regs(VM *vm, size_t entry) {
  struct kvm_regs regs;
  // Get the required general-purpose registers with I/O ops
  if (ioctl(vm->vcpufd, KVM_GET_REGS, &regs) < 0)
    pexit("ioctl(KVM_GET_REGS)");
  regs.rip = entry;
  // User program starts here
  regs.rsp = PS_LIMIT; // Relative to cs at 0?
  regs.rdi = PS_LIMIT;
  regs.rsi = MEM_SIZE - regs.rdi;
  regs.rflags = 0x2; // Required in x86, VM fails without this
  if (ioctl(vm->vcpufd, KVM_SET_REGS, &regs) < 0)
    pexit("ioctl(KVM_SET_REGS)");

  // TODO: Set up gs, ss, fs, es?
}

VM *kvm_init(uint8_t code[], size_t len) {
  // Invoke sys_open to host kernel here?
  int kvmfd = open("/dev/kvm", O_RDWR | __O_CLOEXEC);
  if (kvmfd < 0)
    pexit("open(/dev/kvm)");

  int api_ver = ioctl(kvmfd, KVM_GET_API_VERSION, 0);
  if (api_ver < 0)
    pexit("KVM_GET_API_VERSION");
  if (api_ver != KVM_API_VERSION) {
    error("Got KVM api version %d, expected %d\n", api_ver, KVM_API_VERSION);
  }

  int vmfd = ioctl(kvmfd, KVM_CREATE_VM, 0);
  if (vmfd < 0)
    pexit("ioctl(KVM_CREATE_VM)");

  // Allocate a page to hold the code
  void *mem = mmap(
      0, MEM_SIZE, PROT_READ | PROT_WRITE,
      MAP_SHARED | MAP_ANONYMOUS, // Anon means mapping not backed by any file?
      -1, 0);

  if (mem == NULL)
    pexit("mmap(MEM_SIZE)");

  size_t entry = 0;
  memcpy((void *)mem + entry, code, len);

  struct kvm_userspace_memory_region region = {.slot = 0,
                                               .flags = 0,
                                               .guest_phys_addr = 0,
                                               .memory_size = MEM_SIZE,
                                               .userspace_addr = (size_t)mem};

  if (ioctl(vmfd, KVM_SET_USER_MEMORY_REGION, &region) < 0)
    pexit("ioctl(KVM_SET_USER_MEMORY_REGION)");

  int vcpufd = ioctl(vmfd, KVM_CREATE_VCPU, 0);
  if (vcpufd < 0)
    pexit("ioctl(KVM_CREATE_VCPU)");

  // kvm_run
  size_t vcpu_mmap_size = ioctl(kvmfd, KVM_GET_VCPU_MMAP_SIZE, NULL);
  struct kvm_run *run = (struct kvm_run *)mmap(
      0, vcpu_mmap_size, PROT_READ | PROT_WRITE, MAP_SHARED, vcpufd, 0);

  VM *vm = (VM *)malloc(sizeof(VM));
  *vm = (struct VM){
      .mem = mem, .mem_size = MEM_SIZE, .vcpufd = vcpufd, .run = run};

  setup_regs(vm, entry);
  setup_long_mode(vm);

  return vm;
}

// Copy argv (user program?) onto guest kernel stack
void copy_argv(VM *vm, int argc, char *argv[]) {
  struct kvm_regs regs;
  if (ioctl(vm->vcpufd, KVM_GET_REGS, &regs) < 0)
    pexit("ioctl(KVM_GET_REGS)");

  // Compute host pointer to guest memory,
  // this pointer corresponds to guest stack pointer
  char *sp = (char *)vm->mem + regs.rsp;
  char **copy = (char **)malloc(argc * sizeof(char *));
#define STACK_ALLOC(sp, len)                                                   \
  ({                                                                           \
    sp -= len;                                                                 \
    sp;                                                                        \
  })
  // Store pointers to guest memory
  for (int i = argc - 1; i >= 0; i--) {
    int len = strlen(argv[1]) + 1;
    // Pointer to reserved slot in guest mem
    copy[i] = STACK_ALLOC(sp, len);
    // Copy argv elem to guest mem
    memcpy(copy[i], argv[i], len);
  }
  // Align to 16-byte boundary
  sp = (char *)((uint64_t)sp & -0x10);
  // Push argv
  *(uint64_t *)STACK_ALLOC(sp, sizeof(char *)) = 0; // First elem = 0 why?
  for (int i = argc - 1; i >= 0; i--)
    // Reserve space for stack address
    // subtract vm->mem to yield offset of argv element
    *(uint64_t *)STACK_ALLOC(sp, sizeof(char *)) = copy[i] - (char *)vm->mem;
  // Push argc
  *(uint64_t *)STACK_ALLOC(sp, sizeof(uint64_t)) = argc;
  free(copy);
  regs.rsp = sp - (char *)vm->mem;
#undef STACK_ALLOC // Remove macro to avoid leaking
  if (ioctl(vm->vcpufd, KVM_SET_REGS, &regs) < 0)
    pexit("ioctl(KVM_SET_REGS");
}

int check_iopl(VM *vm) {
  struct kvm_regs regs;
  struct kvm_sregs sregs;
  if (ioctl(vm->vcpufd, KVM_GET_REGS, &regs) < 0)
    pexit("ioctl(KVM_GET_REGS)");
  if (ioctl(vm->vcpufd, KVM_GET_SREGS, &sregs) < 0)
    pexit("ioctl(KVM_GET_SREGS)");
  // Compare CPL and IOPL ranging from 0..3
  return sregs.cs.dpl <= ((regs.rflags >> 12) & 3);
}

void execute(VM *vm) {
  while (1) {
#ifdef DEBUG
    debug("KVM_RUN: entering guest\n");
#endif
    if (ioctl(vm->vcpufd, KVM_RUN, NULL) < 0)
      pexit("ioctl(KVM_RUN)");
#ifdef DEBUG
    debug("KVM_RUN: exited with reason=%u\n", vm->run->exit_reason);
#endif
    dump_regs(vm->vcpufd); // Display current reg state
    switch (vm->run->exit_reason) {
    case KVM_EXIT_HLT:
      // Done running
#ifdef DEBUG
      debug("KVM_EXIT_HLT: guest halted\n");
#endif
      fprintf(stderr, "KVM_EXIT_HLT\n");
      return;
    case KVM_EXIT_IO:
      // Output
#ifdef DEBUG
      debug("KVM_EXIT_IO: direction=%s port=0x%x size=%u count=%u "
            "data_offset=%llu\n",
            vm->run->io.direction == KVM_EXIT_IO_OUT ? "out" : "in",
            vm->run->io.port, vm->run->io.size, vm->run->io.count,
            vm->run->io.data_offset);
#endif
      int iopl_allowed = check_iopl(vm);
#ifdef DEBUG
      debug("KVM_EXIT_IO: IOPL access %s\n",
            iopl_allowed ? "allowed" : "denied");
#endif
      if (!iopl_allowed)
        error("KVM_EXIT_IO\n");
      if (vm->run->io.port & HP_NR_MARK) {
#ifdef DEBUG
        debug("KVM_EXIT_IO: dispatching hypercall port=0x%x\n",
              vm->run->io.port);
#endif
        if (hp_handler(vm->run->io.port, vm) < 0)
          error("Hypercall failed\n");
      } else
        error("Unhandled I/O port: 0x%x\n", vm->run->io.port);
      break;
    case KVM_EXIT_FAIL_ENTRY:
      // Show up when changing initial conditions
      error("KVM_EXIT_FAIL_ENTRY: hardware_entry_failure_reason = 0x%llx\n",
            vm->run->fail_entry.hardware_entry_failure_reason);
    case KVM_EXIT_INTERNAL_ERROR:
      // Error from internal KVM system
      error("KVM_EXIT_INTERNAL_ERROR: suberror = 0x%x\n",
            vm->run->internal.suberror);
    case KVM_EXIT_SHUTDOWN:
      error("KVM_EXIT_SHUTDOWN\n");
    default:
      error("Unhandled reason: %d\n", vm->run->exit_reason);
    }
  }
}

int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("Usage: %s kernel.bin user.elf [user_args...]\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  uint8_t *code;
  size_t len;

  // Read kernel.bin
  read_file(argv[1], &code, &len);
  if (len > MAX_KERNEL_SIZE)
    error("Kernel size exceeded, %zu > MAX_KERNEL_SIZE(%p).\n", len,
          (void *)MAX_KERNEL_SIZE);
  VM *vm = kvm_init(code, len);

  // Read user.elf
  copy_argv(vm, argc - 2, &argv[2]);
  execute(vm);
}
