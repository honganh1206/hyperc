# A hypervisor with a simple build-from-scratch kernel

## VMM

KVM = VM implemented natively in Linux kernel.

A VM needs **user memory region** + **virtual CPUs**.

VMs created has private virtualized hardware e.g., network card, disk, graphic adapter, etc.

Steps: 1. Open KVM -> 2. Create a VM file descriptor -> 3. Set up memory for VM guest with `ioctl` -> 4. Create vCPU -> 5. Map memory for the vCPU -> 6. Put assembled code to user memory region -> 7. Set up vCPU registers -> 8. Run and handle exit reason

## Kernel

Flow: Initialize kernel space (page tables, perms) -> Map memory for user access at SP -> Copy args (program name, args, env vars) -> Execute program (Load binary -> Map program memory -> ??)

Linker script loads executable code at address 0x0, and global/static variables at 0x3000.

Questions:

1. How CPU distinguishes between kernel-mode and user-mode (rings?)
2. How could CPU transfer control to kernel when user invokes `syscall`? (`syscall` is the way to invoke kernel)
3. How kernel switches between kernel and user?

Answers:

1. Controlled by description privilege level (rings)

### Registers
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

For syscalls, we register the syscall handler via setting special registers named MSR (Model Specific Registers). After the setup, we can invoke the syscall instruction and the program will jump to the handler we registered.

### Page Directory Entry

Each PDE is a 64-bit value with control bits in lower positions + physical address in upper bits

```
[Physical Address] [Reserved] [Flags like PRESENT, RW, USER, DIRTY, etc.]
bits 63-12         bits 11-9   bits 8-0
```

## Sorted bins

A storage structure to organize freed memory blocks using structured lists.

The heap manager categorizes free memory chunks to distinct bins based on their sizes.

### Modes

Two modes (user vs. kernel) are distinguished by the dpl (ring)

## ELF files

Standard binary format for executables, shared libs and object files on UNIX-like systems.

ELF header (overall structure) and Program header (How to load segment into memory)

```
ELF File Structure:
┌─────────────────────┐
│ Main Header (1)     │ ← Describes file overall
├─────────────────────┤
│ Program Header (1)  │ ← "Load this segment here"
│ Program Header (2)  │ ← "Load this segment here"
│ Program Header (3)  │ ← "Load this segment here"
├─────────────────────┤
│ Segment Data        │
│ (Code, Data, etc.)  │
└─────────────────────┘

↓ Loader reads program headers ↓

Memory Layout (Virtual Address Space):
┌──────────────────────┐
│ ... empty space ...  │
├──────────────────────┤
│ 0x400000: Segment 1  │ ← Placed here per Program Header 1
│ (code/data)          │
├──────────────────────┤
│ ... gap ...          │
├──────────────────────┤
│ 0x600000: Segment 2  │ ← Placed here per Program Header 2
│ (code/data)          │
├──────────────────────┤
│ ... more memory ...  │
└──────────────────────┘
```

## ASLR

ASLR (Address Space Layout Randomization) is a security technique that randomizes where code, data, and stack are placed in a process's memory each time it runs. 
