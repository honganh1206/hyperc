#include <mm/kmalloc.h>
#include <stdint.h>
#include <utils/panic.h>
#include <utils/string.h>

// Refer to a contiguous free range of memory
struct kmalloc_arena {
  void *top; // Point to next available memory location, bumped after allocation
  uint64_t top_size; // Avaiable memory from top onwards
  void *min_addr;    // Starting address of the entire area
  struct chunk {
    // 16-bit header
    uint64_t size; // 8 bytes at offset 0
    uint64_t pad;  // 8 bytes at offset 8
    struct chunk *next;
  } sorted_bin; // Dedicated, fixed head of list that links together free chunks
};

static struct kmalloc_arena arena;

// Calculate the byte offset of a memory struct field/member
// First cast the null pointer (address 0) to a pointer of the struct type
// then access the MEMBER
// then take the address and convert to a 64-bit integer
#define offsetof(TYPE, MEMBER) ((uint64_t)&((TYPE *)0)->MEMBER)

// Return a pointer to user memory, skip the chunk header (16 bits)
#define chunk2mem(c) ((void *)((uint8_t *)(c) + offsetof(struct chunk, next)))

// Get chunk metadata by going backward 16 bytes
#define mem2chunk(m)                                                           \
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

// Insert the remainder free memory into the list ascending by chunk->size
static inline void insert_sorted(struct chunk *c) {
  struct chunk *now = arena.sorted_bin.next, *prev = &arena.sorted_bin;
  while(now != 0 && now ->size < c->size) {
    // Find the place in the list that fits the conditions
    prev = now;
    now = now->next;
  }
  // Insert the chunk into the part where now->size >= c->size
  prev->next = c;
  c->next = now;
}

// Inline helps the compiler see the function body at call site
static inline int invalid_chunk_size(uint64_t s) {
  if (s == 0) return 1;
  if (s >= (1ull << 32)) return 1; // Exceed max chunk size
  if (s & 0xf) return 1;
  return 0;
}

static void *fetch_sorted_bin(uint64_t nb) {
  // Now points to 1st free node, prev points to sentinel head
  struct chunk *now = arena.sorted_bin.next, *prev = &arena.sorted_bin;
  while (now != 0) {
    if (invalid_chunk_size(now->size)) panic("kmalloc.c#kmalloc: invalid size of sorted bin");
    // Get the best fit chunk from the SORTED bin (when was it sorted though?)
    if (now->size >= nb) {
      // Remove the chosen free chunk from the free list
      // by linking the head to the next free node
      prev->next = now->next;
      // In case same size, just return
      if (now->size == nb) {}
      else {
        // Split the chunk (get just enough), and move the remainder to sorted bin
        struct chunk *r = (struct chunk*) ((uint8_t*)now + nb);
        r->size = now->size - nb;
        insert_sorted(r);
      }
      memset(now, 0, sizeof(struct chunk));
      now->size = nb;
      return chunk2mem(now);
    }
    else {
      // Below the nb size, we are good to go
      // Set the head to the next free node
      prev = now;
      now = now->next;
    }
  }
  return 0;
}

static void *malloc_top(uint64_t nb) {
  // Not enough space to allocate
  if (arena.top_size < nb) return 0;
  arena.top_size -= nb;
  struct chunk* c = (struct chunk*) arena.top;
  c->size = nb;
  arena.top += nb;
  return chunk2mem(c);
}

static void *int_kmalloc(uint64_t nb, int align) {
  // Happy path?
  if (align == MALLOC_NO_ALIGN) {
    // Get the head? if not init at the top?
    void *ret = fetch_sorted_bin(nb);
    if (!ret)
      ret = malloc_top(nb);
    return ret;
  }
  if (align != MALLOC_PAGE_ALIGN)
    panic("kmalloc.c#kmalloc: invalid alignment");
  // Calculate the current alignment of arena.top mod align (power of 2),
  // if result is 0 then it's aligned
  uint64_t cur = (uint64_t) arena.top & (align - 1);

  // Temporarily allocate memory (padding) to skip to next page for alignment
  // so the next allocation will return a pointer that aligns to the requested boundary
  // using mod align again
  uint64_t padding = (((align - offsetof(struct chunk, next)) - cur) & (align - 1));
  
  void *gap = 0;
  if (padding == 0) ; // No need to pad, page already filled
  else {
    gap = malloc_top(padding);
    if (gap == 0) return 0; // Not enough memory to temp fill
  }

  // Return a pointer to next? chunk, satisfying the alignment
  void *ret = malloc_top(nb);

  // Free the padding chunk (either sorted_bin or merge with top)
  kfree(gap);
  return ret;
}

// Round v up to the next multiple of p (page alignment)
// First check for low bits below p are set with mask = p - 1
// if (v & mask) != 0 then v is not aligned and must be rounded up
// by clearing the low bits and add p to round up the value
#define alignup(v, p) (((v) & ((p) - 1)) ? (((v) & (-(p))) + (p)) : (v))

// Allocate a block of free memory for the caller
void *kmalloc(uint64_t len, int align) {
  // Prevent extremely large allocation with fast fail
  if (len >= (1ull << 32))
    return 0;
  // Compute the internal reserved memory size
  // and round it up to multiple of 128 bytes for alignment
  uint64_t nb = alignup(offsetof(struct chunk, next) + len, 0x80);

  // Get the pointer to the usuable region
  void *victim = int_kmalloc(nb, align);
  if (align != MALLOC_NO_ALIGN && ((uint64_t)victim & (align - 1)))
    panic("kmalloc.c#kmalloc: alignment request failed");

  // Populate all chunks with 0 for deterministic initial content
  memset(victim, 0, len);
  return victim;
}
