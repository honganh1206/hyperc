#include "translate.h"
#include <mm/kmalloc.h>
#include <mm/translate.h>
#include <stdint.h>
#include <utils/panic.h>

#define _OFFSET(v, bits) (((uint64_t)(v) >> bits) & 0x1ff)
// Extract the 9-bit indices to index the table entries
#define PML4_OFFSET(v) _OFFSET(v, 39)
#define PDP_OFFSET(v) _OFFSET(v, 30)
#define PD_OFFSET(v) _OFFSET(v, 21)
#define PT_OFFSET(v) _OFFSET(v, 12)

/* Maps
 *  0x8000000000 ~ 0x8040000000 -> 0 ~ 0x40000000
 */
void init_pagetable() {
  uint64_t *pml4;
  // Store PML4 base address in register CR3 (control register for setting
  // paging attributes)
  asm("mov %[pml4], cr3" : [pml4] "=r"(pml4));
  // Start PDP table at offset 0x3 from PML4 base address
  // assuming pre-allocated memory at that offset
  uint64_t *pdp = (uint64_t *)((uint64_t)pml4 + 0x3000);
  // Map entry 1 of 512 entries to the physical address of PDP table
  pml4[1] = PDE64_PRESENT | PDE64_RW | (uint64_t)pdp; // 0x8000000000
  // Set PD table at offset 0x1
  uint64_t *pd = (uint64_t *)((uint64_t)pdp + 0x1000);
  // Map PDP entry to PD
  pdp[0] = PDE64_PRESENT | PDE64_RW | (uint64_t)pd;
  // Why loop two times here? two entries only?
  // we have only 2 pages? Each is 2 MiB?
  for (uint64_t i = 0; i < 0x200; i++) {
    pd[i] = PDE64_PRESENT | PDE64_RW | PDE64_PS | (i * KERNEL_PAGING_SIZE);
  }
}

// NOTE: Inline the function inside another function
// instead of moving the pointer to where this function is
static inline uint64_t *get_pml4_addr() {
  uint64_t pml4;
  // Load the PML4 table register cr3
  asm("mov %[pml4], cr3" : [pml4] "=r"(pml4));
  return (uint64_t *)(pml4 | KERNEL_BASE_OFFSET);
}

/*
 * Convert the kernel-space virtual address
 * back to the underlying physical address */
uint64_t physical(void *vaddr_) {
  uint64_t vaddr = (uint64_t)vaddr_;
  // Check if at least some bits used by the kernel-mapping are set
  // so the address is in the kernel-mapped region
  if (vaddr & KERNEL_BASE_OFFSET)
    // XOR clears the kernel-mapping bits and we get the physical frame base
    return vaddr ^ KERNEL_BASE_OFFSET;
  panic("transalte.c#physical: don't pass non-kernel based address");
}

/*
 * Translate virtual address to physical address
 * return -1 if page not presented or permission not matched*/
uint64_t translate(void *vaddr, int usermode, int writable) {
  uint64_t *pml4 = get_pml4_addr(), *pdp, *pd, *pt, *ret;
  // Macro to walk the virtual address through page tables
  // and create a kernel virtual pointer pointing to a 4KB page frame.
  // This macro is local to translate() only
  // to avoid name collision and faster inline expansion.
#define PAGING(p, c)                                                           \
  do {                                                                         \
    if (!(*p & PDE64_PRESENT))                                                 \
      return -1;                                                               \
    if (usermode && !(*p & PDE64_USER))                                        \
      return -1;                                                               \
    if (writable && !(*p & PDE64_RW))                                          \
      return -1;                                                               \
    c = (uint64_t *)((*p & -0x1000) | KERNEL_BASE_OFFSET);                     \
  } while (0);

  PAGING(&pml4[PML4_OFFSET(vaddr)], pdp);
  PAGING(&pdp[PDP_OFFSET(vaddr)], pd);
  PAGING(&pd[PD_OFFSET(vaddr)], pt);
  if (pd[PD_OFFSET(vaddr)] & PDE64_PS)
    // PD entry describes a huge (2 MiB) page
    // instead of pointing to a leaf PTE in the PT level
    // so we clear the low (right-side) 21 bits to compute the 2 MiB-aligned
    // physical base
    // (Why huge?) Map directly to a PD entry when PS bit is set
    return (pd[PD_OFFSET(vaddr)] & -0x200000) + ((uint64_t)vaddr & 0x1fffff);
  PAGING(&pt[PT_OFFSET(vaddr)], ret);
#undef PAGING
  // Extract the offset inside 2 MiB region
  // Get the kernel virtual pointer (ret) to point the mapped physical base page
  return physical(ret) + ((uint64_t)vaddr & 0xfff);
}

// Populate the tables (PML4, PDP, PD) and set permissions
void add_trans_user(void *vaddr_, void *paddr_, int prot) {
  uint64_t vaddr = (uint64_t)vaddr_;
  // Validation of vaddr should be done in sys_mmap
  // so we can + should just panic here
  if (!USER_MEM_RANGE_OK(vaddr))
    panic("translate.c#add_trans_user: not allowed memory range");

  // Extract the physical address without the base address?
  uint64_t paddr = (uint64_t)paddr_ & ~KERNEL_BASE_OFFSET;

  uint64_t *pml4 = get_pml4_addr(), *pdp, *pd, *pt;

  // Allocate a new page table or retrieve an existing one
#define PAGING(p, c)                                                           \
  do {                                                                         \
    if (!(*p & PDE64_PRESENT)) {                                               \
      c = (uint64_t *)kmalloc(0x1000, MALLOC_PAGE_ALIGN);                      \
      *p = PDE64_PRESENT | PDE64_RW | PDE64_USER | physical(c);                \
    } else {                                                                   \
      if (!(*p & PDE64_USER))                                                  \
        panic("translate.c#add_trans_user: invalid address");                  \
      c = (uint64_t *)((*p & -MALLOC_PAGE_ALIGN) | KERNEL_BASE_OFFSET);        \
    }                                                                          \
  } while (0);
  PAGING(&pml4[PML4_OFFSET(vaddr)], pdp);
  PAGING(&pdp[PDP_OFFSET(vaddr)], pd);
  PAGING(&pd[PD_OFFSET(vaddr)], pt);
#undef PAGING

  // Set up protection bits on page tables
  pt[PT_OFFSET(vaddr)] = PDE64_PRESENT | paddr;
  if (prot & PROT_R)
    pt[PT_OFFSET(vaddr)] |= PDE64_USER;
  if (prot & PROT_W)
    pt[PT_OFFSET(vaddr)] |= PDE64_RW;
}

int pf_to_prot(Elf64_Word pf) {
  int ret = 0;
  if (pf & PF_R)
    ret |= PROT_R;
  if (pf & PF_W)
    ret |= PROT_W;
  if (pf & PF_X)
    ret |= PROT_X;
  return ret;
}

// Update the permissions of a page table entry
int modify_permission(void *vaddr, int prot) {
  uint64_t *pml4 = get_pml4_addr(), *pdp, *pd, *pt;
  // Get the chuk that has the page?
#define PAGING(p, c)                                                           \
  do {                                                                         \
    if (!(*p & PDE64_PRESENT))                                                 \
      return -1;                                                               \
    c = (uint64_t *)((*p & -MALLOC_PAGE_ALIGN) | KERNEL_BASE_OFFSET);          \
  } while (0);

  // Traverse through the nested page tables
  PAGING(&pml4[PML4_OFFSET(vaddr)], pdp);
  PAGING(&pdp[PDP_OFFSET(vaddr)], pd);
  PAGING(&pd[PD_OFFSET(vaddr)], pt);

#undef PAGING
  uint64_t *e = &pt[PT_OFFSET(vaddr)];
  if (!(*e & PDE64_PRESENT))
    return -1;
  // Clear the user access (R) and RW bits (W)
  *e &= ~(PDE64_USER | PDE64_RW);
  if (prot & PROT_R)
    *e |= PDE64_USER;
  if (prot & PROT_W)
    *e |= PDE64_RW;
  return 0;
}
