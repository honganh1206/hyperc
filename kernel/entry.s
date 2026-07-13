.globl _start, hlt
.extern kernel_main
.intel_syntax noprefix
_start:
    // Args
    mov rdx, [rsp]
    // Argv loads 8 bits on stack?
    lea rcx, [rsp + 8]
    call kernel_main
hlt:
    hlt
    jmp hlt
