#include <mm/kmalloc.h>
#include <syscalls/sys_execve.h>
#include <mm/translate.h>
#include <utils/string.h>
#include <stdint.h>

// Model Specific Registers
#define MSR_STAR  0xc0000081 /* legacy mode SYSCALL target, must have for compatibility */
#define MSR_LSTAR 0xc0000082 /* Magic number: long mode SYSCALL target (See: https://codebrowser.dev/linux/linux/arch/x86/include/asm/msr-index.h.html#12) */
#define MSR_CSTAR 0xc0000083 /* compat mode SYSCALL target */
#define MSR_SYSCALL_MASK 0xc0000084

int register_syscall() {
  asm(
      // Set kernel + user code/stack segment selectors for legacy 32-bit mode (have to)
      "xor rax, rax;"          // Set RAX = 0x00000000
      "mov rdx, 0x00200008;"   // Set RDX = 0x00200008
      "mov ecx, %[msr_star];" // Set ECX = 0xc0000081 (MSR_STAR ID)

      // Tell CPU which RFLAGS bits to clear when entering kernel mode
      // 0x3f7fd5 clears: Carry, Auxiliary, Sign, Interrupt, Direction, IOPL, Overflow 
      // Without the mask/Mask not set properly, kernel will inherit rflags set in user mode
      // Most importantly: Clears IF (Interrupt Flag) to disable interrupts in kernel
      "mov eax, %[fmask];"     // EAX = 0x3f7fd5 (RFLAGS mask)
      "xor rdx, rdx;"          // RDX = 0x00000000
      "mov ecx, %[msr_fmask];" // ECX = 0xc0000084 (MSR_SYSCALL_MASK ID)
      "wrmsr;"                 // Write MSR_SYSCALL_MASK

      // Point CPU to kernel handler (syscall_entry.s) by pointing rip to it
      // Specify 64-bit kernel handler access
      // When user code executes SYSCALL, CPU jumps here
      "lea rax, [rip + syscall_entry];" // RAX = address of syscall_entry (how to get from syscalls/syscall_entry.s?)
                                        // function
      "mov rdx, %[base] >> 32;"  // RDX = high 32 bits of KERNEL_BASE_OFFSET
      "mov ecx, %[msr_syscall];" // ECX = 0xc0000082 (MSR_LSTAR ID)
      "wrmsr;"                   // Write MSR_LSTAR
      ::[msr_star]"i"(MSR_STAR),
        [fmask]"i"(0x3f7fd5), [msr_fmask]"i"(MSR_SYSCALL_MASK),
        [base]"i"(KERNEL_BASE_OFFSET), [msr_syscall]"i"(MSR_LSTAR)
      : "rax", "rdx", "rcx" // RCX saves the return address (address of next instruction)
  );
  return 0;
}

// Prepare kernel args for user space execution
void switch_user(uint64_t argc, char *argv[]) {
  // Get the end of last arg string and subtract start address of 1st argument
  int total_len = (argv[argc - 1] + strlen(argv[argc - 1] + 1) - (char *)argv);
  // temp area for putting user-accessible data (what?)...
  char *s = kmalloc(total_len, MALLOC_PAGE_ALIGN);
  // Get the physical address of stack pointer
  uint64_t sp = physical(s);

  // Map memory for user access at sp (user stack setup)
  // so user program can do read + write
  add_trans_user((void *)sp, (void *)sp, PROT_RW);

  // Update arg pointers to point to user-accessible area instead of virtual
  // addresses Take the address of arg, subtract to 1st arg address, then
  // increment by sp
  for (int i = 0; i < argc; i++)
    argv[i] = (char *)(argv[i] - (char *)argv + sp);

  // Copy arguments to user-accesible area
  memcpy(s, argv, total_len);

  // Execute the program. Args from left to right:
  // 1. Program's name
  // 2. Pointer to argv array
  // 3. Pointer to env vars in user space
  sys_execve(argv[0], (char **)sp, (char **)(sp + argc * sizeof(char *)));
}

// NOTE: Cannot set as main because different params
// This should never return, expecting the user program to run forever?
int kernel_main(void *addr, uint64_t len, uint64_t argc, char *argv[]) {
  // Kernel init itself
  init_pagetable();
  init_allocator((void *)((uint64_t)addr | KERNEL_BASE_OFFSET), len);
  if (register_syscall() != 0)
    return 1;
  // Run the user program
  // and the program uses syscalls to interact with the VMM
  switch_user(argc, argv);
  return 0;
}
