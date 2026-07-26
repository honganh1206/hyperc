#ifndef TRANSLATE_H
#define TRANSLATE_H

#include <stdint.h>
#include <elf/elf.h>
// Protection flags
#define PROT_R 1
#define PROT_W 2
#define PROT_X 3 // Execute
// Combination
#define PROT_RW (PROT_R | PROT_W)
#define PROT_RWX (PROT_RW | PROT_X)

// 64-bit page directory entry bits for x86-64 paging
#define PDE64_PRESENT 1         // Page present in mem
#define PDE64_RW (1 << 1)       // Page is writable
#define PDE64_USER (1 << 2)     // User-mode access allowed (0 if kernel-only)
#define PDE64_ACCESSED (1 << 5) // Set by CPU when page is accessed
#define PDE64_DIRTY (1 << 6)    // CPU set when page is written to
#define PDE64_PS (1 << 7)       // Page size (1 = large page, 0 = 4KB page)
#define PDE64_G (1 << 8)        // Global page

#define KERNEL_PAGING_SIZE (0x200000) // Also the start of free memory
#define MIN_MMAP_ADDR KERNEL_PAGING_SIZE
#define KERNEL_BASE_OFFSET                                                     \
  (0x8000000000llu) // Start of kernel segment in memory

#define MIN_USER_MEM MIN_MMAP_ADDR

// Check if the memory is in the valid range:
// 1. Must start from the free memory region
// 2. The lower half (16 bits on the right) should be in user space
// 3. Ensure bit 39 is not set so we do not collapse with kernel memory region
#define USER_MEM_RANGE_OK(v)                                                   \
  ((uint64_t)(v) >= MIN_USER_MEM && ((uint64_t)(v) >> 48) == 0 &&              \
   ((uint64_t)(v) >> 39) != 1)

void init_pagetable();

uint64_t translate(void *vaddr, int usermode, int writable);
uint64_t physical(void *vaddr);

void add_trans_user(void* vaddr_, void* paddr_, int prot);

// Convert ELF flags (common) to memory protection bits (CPU arch based)
int pf_to_prot(Elf64_Word pf);
int modify_permission(void *vaddr, int prot);

#endif
