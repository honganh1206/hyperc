#include <stdint.h>

void *memset(void *b, int c, uint64_t len) {
    for (int i = 0; i < len; i++) {
        ((uint8_t*)b)[i] = (uint8_t)c;
    }
    return b;
}

void *memcpy(void *dst, const void *src, uint64_t n) {
    asm(
        "mov rcx, %[n];" // Move num of bytes to rcx (counter for rep instr)
        // Repeat this instruction: Move one byte from rsi to rdi and increment both pointers rcx times
        "rep movsb byte ptr[%[dst]], byte ptr [%[src]];"
        // Constraints (left to right):
        // General-purpose register r
        // rdi register D
        // rsi register S
        // also clobber list (rcx is modified by this assemblt block)
        :: [n]"r"(n), [dst]"D"(dst), [src]"S"(src) : "rcx"
    );
    return dst;
}

uint64_t strnlen(const char *s, uint64_t maxlen) {
    uint64_t i = 0;
    while (i < maxlen) {
        if (*s == 0) return i; // End of string here
        i++; s++;
    }
    return maxlen;
}


uint64_t strlen(const char *s) {
    return strnlen(s, (1ull << 63) - 1);
}
