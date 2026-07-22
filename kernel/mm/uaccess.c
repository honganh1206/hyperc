#include <mm/uaccess.h>
#include <mm/kmalloc.h>
#include <mm/translate.h>
#include <utils/string.h>
#include <utils/misc.h>

// Check memory locations from addr to addr + size are accessible to users 
// based on permission types
int access_ok(int type, const void *addr_, uint64_t size) {
    uint64_t addr = (uint64_t) addr_;
    // Check beginning and end address first for accessibility
    if (!USER_MEM_RANGE_OK(addr)) return 0;
    if (!USER_MEM_RANGE_OK(addr + size - 1)) return 0;
    // Loop through every 4KB page (0x1000) that overlaps the range?
    // also rounding down/up the start/end address to the nearest 4KB boundary (why?)
    for(uint64_t v = aligndown(addr); v < alignup(addr + size); v += 0x1000)
        // Two checks: Accessible from user context + read/write
        if (translate((void*) v, 1, type) == (uint64_t) -1) return 0;
    return 1;
}

int access_string_ok(const void *addr_) {
    if (!access_ok(VERIFY_READ, addr_, 1)) return 0;
    uint64_t addr = (uint64_t) addr_;
    // Bytes left of the current 4KB page before crossing into the next page
    uint64_t remain_size = 0x1000 - (addr & 0xfff); // Page start - offset (lowest 12 bits)
    uint64_t l = strnlen(addr_, remain_size);

    // At this point we should have check accessbility
    // but if not => recursively checking it
    if (l == remain_size) return access_string_ok((void*) (addr + l));
    return 1;
}

void *copy_str_from_user(const char *s) {
    int len = strlen(s);
    // Why +1?
    void *dst = kmalloc(len + 1, MALLOC_NO_ALIGN);
    if (dst == 0) return 0;
    memcpy(dst, s, len + 1);
    return dst;
}
