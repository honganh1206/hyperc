#include <mm/mmap.h>
#include <mm/kmalloc.h>
#include <mm/translate.h>
#include <utils/panic.h>
#include <utils/misc.h>
#include <utils/errno.h>

// Map files directly to the program's virtual memory space
// so program can modify files.
// Think of it like a shared window for the kernel to read/write from
void *mmap(void *addr, uint64_t len, int prot) {
    // Second if check is for page alignment (0xfff = 4095, but should be 4096 as typical x86-64 page)
    if(len == 0 || len & 0xfff) panic("mmap.c: invalid length");

    void *ret = kmalloc(len, MALLOC_PAGE_ALIGN);
    if (ret == 0) return 0; // No mem

    // Simple static persistent cursor that remembers the last virtual address across mmap calls
    static void *last_mmapped = (void*) -1;
    // No ASLR, first time run at the fixed high canonical user-space address and downwards from here
    if(last_mmapped == (void*) -1) last_mmapped = (void *) 0x00007ffff7fff000ull;

    // Caller asks kernel to choose an address -> Get the last_mmapped as start address
    if(addr == 0) last_mmapped = addr = last_mmapped - len;

    // Init the pages + set perms for program segments
    for(uint64_t i = 0; i < len; i += 0x1000)
        // User virtual -> kernel physical translation with requested protection
        add_trans_user(addr + i, ret + i, prot);

    return addr;
}

int mprotect(void *addr, uint64_t len, int prot) {
    if(!alignok(addr)) return -EINVAL;
    for(uint64_t i = 0; i < len; i += 0x1000) {
        if(!USER_MEM_RANGE_OK(addr + i) || modify_permission(addr + i, prot) != 0) {
            return -EACCES;
        }
    }
    return 0;
}

