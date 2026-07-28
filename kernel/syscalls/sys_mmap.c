#include <hypercalls/hp_read.h>
#include <hypercalls/hp_lseek.h>
#include <syscalls/sys_mmap.h>
#include <mm/translate.h>
#include <mm/mmap.h>
#include <utils/misc.h>
#include <utils/errno.h>

void *sys_mmap(void *addr, uint64_t len, int prot, int flags, int fd, uint64_t offset) {
    if(!alignok(addr)) return (void *) -EINVAL;
    if(len == 0) return (void*) -EINVAL;

    // No fixed memory location, so decide by kernel
    if(!(flags & MAP_FIXED)) addr = 0;
    else if(addr != 0 && !USER_MEM_RANGE_OK(addr)) return (void *) -EINVAL;

    uint64_t aligned_len = alignup(len);
    // Call to internal mmap whattt...
    // and temp? make it read/writable (why? what do we need to write into? memory from segment?)
    addr = mmap(addr, aligned_len, prot | PROT_RW);
    if(addr == 0) return (void *) -ENOMEM;

    if(fd >= 0) {
        // Get the address of the fd bare-metal? (custom kernel syscall -> hypercall -> real file I/O)
        int ret = hp_lseek(fd, offset, SEEK_SET);
        // Casting twice like this feel exhausting, why having to cast to void* ? Compat?
        if(ret < 0) return (void *) (int64_t) ret;
        hp_read(fd, translate(addr, 1, 1), len);
    }

    // Should NEVER fail (why?)
    // apply protection bits?
    mprotect(addr, aligned_len, prot);

    return addr;
}
