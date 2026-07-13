# Build a hypervisor with a build-from-scratch simple kernel

## VMM

KVM = VM implemented natively in Linux kernel.

A VM needs **user memory region** + **virtual CPUs**.

VMs created has private virtualized hardware e.g., network card, disk, graphic adapter, etc.

Steps: 1. Open KVM -> 2. Create a VM file descriptor -> 3. Set up memory for VM guest with `ioctl` -> 4. Create vCPU -> 5. Map memory for the vCPU -> 6. Put assembled code to user memory region -> 7. Set up vCPU registers -> 8. Run and handle exit reason

## Kernel

Linker script loads executable code at address 0x0, and global/static variables at 0x3000.

Questions:

1. How CPU distinguishes between kernel-mode and user-mode (rings?)
2. How could CPU transfer control to kernel when user invokes `syscall`? (`syscall` is the way to invoke kernel)
3. How kernel switches between kernel and user?

Answers:

1. Controlled by description privilege level (rings)

### Syscalls

We use the special register `efer` (collection of binary switches) to enable syscall/sysenter instruction.

```c
// Switch on Long Mode Enable and Long Mode Activated with two 1 bits
sregs->efer = 0x500; // EFER_LME | EFER_LMA

// Switch on syscall as well with LME and LMA
//  0101 0000 0000
// |0000 0000 0001
// ----------------
//  0101 0000 0001 (last bit is syscall)
sregs->efer |= 0x1; // EFER_SCE
```

### Page Directory Entry

Each PDE is a 64-bit value with control bits in lower positions + physical address in upper bits

```
[Physical Address] [Reserved] [Flags like PRESENT, RW, USER, DIRTY, etc.]
bits 63-12         bits 11-9   bits 8-0
```


