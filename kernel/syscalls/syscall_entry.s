# Can be called anywhere
.globl syscall_entry, kernel_stack
# Defined somewhere in a .c file and will be called later
.extern syscall_handler
.intel_syntax noprefix

# Allocate two 8 bytes (hence quad) static variables
# to store kernel and user stack pointer
kernel_stack: .quad 0
user_stack: .quad 0

syscall_entry:
    # Save current stack pointer (user mode) to return to later
    mov [rip + user_stack], rsp
    # In kernel mode now, load the pointer to rsp
    mov rsp, [rip + kernel_stack]
    # Save non-callee saved registers since syscall_handler will destroy this
    # so we can restore state after syscall is completed
    push rdi
    push rsi
    push rdx
    push rcx
    push r8
    push r9
    push r10
    push r11

    # When executing syscall instruction in user mode, the 4th arg is r10 instead of rcx (x86-64 system v abi)
    mov rcx, r10

    # Now that these registers are cleared for syscall_handler
    call syscall_handler

    # Restore non-callee saved registers
    pop r11
    pop r10
    pop r9
    pop r8
    pop rcx
    pop rdx
    pop rsi
    pop rdi

    # Restore user stack's pointer (back to user mode)
    mov rsp, [rip + user_stack]

    # REX.W prefix to be used with sysretq
    # as the 64-bit version of sysret instruction
    .byte 0x48
    sysretq
