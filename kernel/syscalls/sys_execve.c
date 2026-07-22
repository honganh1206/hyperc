#include <syscalls/sys_execve.h>
#include <syscalls/sys_open.h>
#include <utils/errno.h>

// Can only be used in kernel_main (or only use? why?)
int sys_execve(const char *path, char *const argv[], char *const envp[]) {
    // Will these syscalls call to hypercalls? Or the other way around?
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
