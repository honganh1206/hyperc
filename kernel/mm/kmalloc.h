#ifndef KMALLOC_H
#define KMALLOC_H

#include <stdint.h>

/* Initialize memory allocator? */
void init_allocator(void *addr, uint64_t len);

// No alignment required, allocate memory at any available address
#define MALLOC_NO_ALIGN 0x0;
// Page-aligned allocation. Allocate memory at address that are multiple of 4096 bytes
#define MALLOC_PAGE_ALIGN 0x1000;

void *kmalloc(uint64_t len, int align);
void kfree(void *addr);

#endif
