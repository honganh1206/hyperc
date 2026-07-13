#include <stdint.h>

void *memset(void *b, int c, uint64_t len) {
    for (int i = 0; i < len; i++) {
        ((uint8_t*)b)[i] = (uint8_t)c;
    }
    return b;
}
