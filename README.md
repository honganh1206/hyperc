# Build a hypervisor with a build-from-scratch simple kernel

## VMM

KVM = VM implemented natively in Linux kernel.

A VM needs **user memory region** + **virtual CPUs**.

VMs created has private virtualized hardware e.g., network card, disk, graphic adapter, etc.

Steps: 1. Open KVM -> 2. Create a VM file descriptor -> 3. Set up memory for VM guest with `ioctl` -> 4. Create vCPU -> 5. Map memory for the vCPU -> 6. Put assembled code to user memory region -> 7. Set up vCPU registers -> 8. Run and handle exit reason
