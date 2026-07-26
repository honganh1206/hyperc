#include <syscalls/sys_execve.h>
#include <syscalls/sys_open.h>
#include <hypercalls/hp_read.h>
#include <syscalls/sys_mmap.h>
#include <utils/errno.h>
#include <mm/kmalloc.h>
#include <mm/translate.h>
#include <mm/mmap.h>
#include <elf/elf.h>
#include <utils/string.h>
#include <utils/misc.h>

// Load the ELF to the VM
static int load_binary(int fd, process *p) {
    void *buf = kmalloc(0x1000, MALLOC_NO_ALIGN);
    hp_read(fd, physical(buf), 0x1000);
    Elf64_Ehdr *ehdr = (Elf64_Ehdr*) buf;

    // Validate the magic number plus flags for 64-bit, little-endian, System V ABI. R
    if (memcmp(ehdr->e_ident, "\177ELF\x02\x01\x01\0\0\0\0\0\0\0\0\0", 16) != 0)
        return -ENOEXEC;

    p->entry = ehdr->e_entry;
    p->load_addr = 0;

    // Only allow executable (old-style binaries) and shared object types (modern binaries like gcc default)
    if(ehdr->e_type != ET_EXEC && ehdr->e_type != ET_DYN) return -ENOEXEC;

    // Fixed based address simulating Address Space Layout Randomization (ASLR)
    // We load ET_EXEC at 0x0 (fixed) and ET_DYN at 0x0000555555554000 
    // to avoid conflicts
    if(ehdr->e_type == ET_DYN) p->load_addr = 0x0000555555554000ull;

    // Metaheader should end here
    if(ehdr->e_phoff != sizeof(*ehdr)) return -EINVAL;
    if(ehdr->e_phentsize != sizeof(Elf64_Phdr)) return -EINVAL;

    // Check total size of program headers (64 bytes only)
    if(ehdr->e_phoff + (uint64_t) ehdr->e_phentsize * ehdr->e_phnum > 0x1000) return -EINVAL;

    // Get the start of program header section
    Elf64_Phdr *phdr = (Elf64_Phdr*) ((uint8_t*) buf + ehdr->e_phoff);

    // Loop through loadable/program segments
    for(int i = 0; i < ehdr->e_phnum; i++, phdr++) {
        if(phdr->p_type == PT_LOAD) {
            // Align start and end address of a segment
            uint64_t sz = phdr->p_filesz;
            uint64_t st = p->load_addr + aligndown(phdr->p_vaddr),
                    ed = p->load_addr + alignup(phdr->p_vaddr + sz);
            
            // Convert ELF flags (describe program intents) to memory protection bits (R/W/X, CPU/MMU specific)
            // Example: PF_W = 1 to PROT_WRITE = 2
            // Why do this? -> ELF is the standard but CPU protection mechanisms vary
            // so this is an abstraction
            int prot = pf_to_prot(phdr->p_flags);

            // not a good idea to allocate extra memory to handle misalignment, 
            // but it works (good idea is to handle partial page)
            // map file segment into process memory
            void *r = sys_mmap(
                (void*) st,
                // Extra space for misalignment (why? how?)
                sz + (phdr->p_offset & 0xfff), 
                prot,
                MAP_FIXED, // Place at the EXACT address 
                fd,
                phdr->p_offset & -0x1000 // Start reading from page-aligned file offset
            );
            
            // Treat error pointer as signed 64-bit 
            // and truncate to 32 bit as standard error code size
            if (r != (void*) st) return (int) (int64_t) r;

            if(phdr->p_memsz > sz) {
                // BSS section (uninitialzed data?)
                uint64_t bss_ed = p->load_addr + alignup(phdr->p_vaddr + phdr->p_memsz);
                if(bss_ed != ed) {
                    if(mmap((void*) ed, bss_ed - ed, prot) != (void *) ed) return -ENOMEM;
                }
            }
        }
    }

    // Set up stack
    p->stack_base = 0x00007ffffffff000ull;
    p->stack_size = 0x40000; // 26 MiB?
    p->rsp = p->stack_base - 0x1000;
    void *st = (void*) (p->stack_base - p->stack_size);

    // Allocate stack memory with read/write permission (add R/W to every byte?)
    if(mmap(st, p->stack_size, PROT_RW) != st) return -ENOMEM;
    return 0;
}

// Can only be used in kernel_main (or only use? why?)
int sys_execve(const char *path, char *const argv[], char *const envp[]) {
    int fd = sys_open(path);
    if (fd < 0) return fd; // Error?

    process p;

    int ret = load_binary(fd, &p);
    if (ret < 0) return ret;
    sys_close(fd);

    // Build the stack image for the new process (why need?)
    // by copying argv and envp to the new mapped user stack
    if (create_elf_info(&p, argv, envp)) return -EFAULT;

    // This is an execve call so we can ignore saved registries like rip and rsp (why???)
    asm volatile(
        // volatile means running this exactly where this block appears without optimization
        "mov [rip + kernel_stack], rsp;" // Init rsp?
        "mov rcx, %[entry];" // rip?
        "mov r11, 0x2;" // rflags?
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
        "sysretq"
        // GCC extended-asm operand syntax: "template" : outputs : inputs : clobbers
        :: [entry]"r"(p.entry + p.load_addr), [rsp]"r"(p.rsp)
        : "r11", "rcx"
    );

    // never reached (why?)
    return -EPERM;
}
