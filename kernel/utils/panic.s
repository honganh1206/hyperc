.globl panic
.extern hlt
.intel_syntax noprefix
panic:
  # Move string pointer (error message) from register edi to eax
  mov eax, edi
  # Load port to dx
  mov dx, 0xffff /* NR_HP panic */
  # Send hypercall to the hypervisor, passing the message pointer
  out dx, eax
  # Halt execution
  jmp hlt
