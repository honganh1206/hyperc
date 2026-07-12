#include <stdint.h>

// NOTE: What does arena mean here?
struct kmalloc_arena {
  // NOTE: What does top mean?
  void *top;
  uint64_t top_size;
  void *min_addr;
  struct chunk {
    uint64_t size;
    uint64_t pad;
    struct chunk *next;
  } sorted_bin;
};

static struct kmalloc_areana arena;

#define offsetof(TYPE, MEMBER) ((uint64_t) &((TYPE *)0)->MEMBER))
