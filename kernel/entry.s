# Global symbols, visible to linker
.globl _start, hlt
# External symbol defined somewhere else
.extern kernel_main
# Switch to Intel syntax (Default is AT&T)
.intel_syntax noprefix

_start:
    # Load the value (from memory) top of stack to rdx
    mov rdx, [rsp]
    # Load the address of rsp + 8 (argv pointer) to rcx
    lea rcx, [rsp + 8]
    # Call kernel_main with argc in rdx and argv in rcx
    call kernel_main

# Halt the CPU because without this indefinite loop the CPU will execute random code
hlt:
    hlt
    # Jump back to hlt instr
    jmp hlt
