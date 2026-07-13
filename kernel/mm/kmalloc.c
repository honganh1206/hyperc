#include <stdint.h>
#include <utils/string.h>
#include <utils/panic.h>

// Represent the memory pool the allocator manages?
struct kmalloc_arena {
  void *top;         // Point to next available memory location
  uint64_t top_size; // Avaiable memory from top onwards
  void *min_addr;    // Starting address of the entire area
  struct chunk {
    // 16-bit header
    uint64_t size; // 8 bytes at offset 0
    uint64_t pad;  // 8 bytes at offset 8
    struct chunk *next;
  } sorted_bin;
};

static struct kmalloc_arena arena;

// Calculate the byte offset of a memory struct field/member
// First cast the null pointer (address 0) to a pointer of the struct type
// then access the MEMBER
// then take the address and convert to a 64-bit integer
#define offsetof(TYPE, MEMBER) ((uint64_t) &((TYPE *)0)->MEMBER)

// Return a pointer to user memory, skip the chunk header (16 bits)
#define chunk2mem(c) ((void *)((uint8_t *)(c) + offsetof(struct chunk, next)))

// Get chunk metadata by going backward 16 bytes
#define mem2chunk(m) \
  ((struct chunk *)((uint8_t *)(m) - offsetof(struct chunk, next)))

void init_allocator(void *addr, uint64_t len) {
  if (len == 0 || (len & 0xfff) != 0)
    panic("kmalloc.c#init_allocator: invalid length");

  arena.top = addr;
  arena.top_size = len;
  arena.min_addr = addr;
  // Fill the region with 0 bits
  memset(&arena.sorted_bin, 0, sizeof(arena.sorted_bin));
}
