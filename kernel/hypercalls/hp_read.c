#include <hypercalls/hp_read.h>
#include <mm/kmalloc.h>
#include <mm/translate.h>
#include <hypercalls/hypercall_table.h>
#include <hypercalls/hypercall.h>

int hp_read(int fildes, uint64_t phy_addr, uint64_t nbyte) {
    // Why mul by 3?
    uint64_t *kbuf = kmalloc(sizeof(uint64_t) * 3, MALLOC_NO_ALIGN);
    // Set up args?
    kbuf[0] = fildes;
    kbuf[1] = phy_addr;
    kbuf[2] = nbyte;

    // Get the return address to the caller
    int ret = hypercall(NR_HP_read, physical(kbuf));
    kfree(kbuf);
    return ret;
}
