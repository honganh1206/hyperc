#include <syscalls/syscall_handler.h>
#include <utils/errno.h>
#include <mm/translate.h>

// Populated by ENTRY macro
static const void* syscall_table[MAX_SYS_NR + 1] = {

// Preprocessor helper macro that maps macro like SYS_READ to symbol sys_read
#define ENTRY(f) [SYS_##f]=sys_##f
    // Use a token-parsing operator ## to join tokens at pre-procesisng time
    ENTRY(read),
    ENTRY(write),
    ENTRY(open),
    ENTRY(close),
    ENTRY(exit),
#undef ENTRY
};

uint64_t syscall_handler(uint64_t arg0, uint64_t arg1, uint64_t arg2, uint64_t arg3, uint64_t arg4, uint64_t arg5) {
    uint32_t nr;

    // Load the syscall number from eax register
    asm(
        "mov %[nr], eax;"
        : [nr] "=r"(nr)
    );

    if(nr > MAX_SYS_NR || syscall_table[nr] == 0) return -ENOSYS;

    // Get the kernel virtual address of the syscall function we want to invoke
    void *fptr = (void*) ((uint64_t) syscall_table[nr] | KERNEL_BASE_OFFSET);

    // Cast to syscall-function type before invocation
    return ((uint64_t(*)(
        uint64_t, uint64_t, uint64_t,
        uint64_t, uint64_t, uint64_t
    )) fptr)(
        arg0, arg1, arg2,
        arg3, arg4, arg5
    );
}
