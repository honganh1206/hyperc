#ifndef SYS_EXECVE_H
#define SYS_EXECVE_H

#include <stdint.h>

// A process' memory layout and execution state in the kernel
typedef struct process {
    // Base address where the executable is loaded into virtual memory
    uint64_t load_addr;
    // Address of where execution begins
    uint64_t entry;
    // Base address of the stack (the high end for x86-64)
    uint64_t stack_base;
    // Size of the allocated stack
    uint64_t stack_size;
    // Stack pointer register value
    uint64_t rsp;
} process;

int sys_execve(const char *path, char *const argv[], char *const envp[]);

#endif
