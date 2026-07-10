
// Common macros
#include <linux/kvm.h>
#include <stdint.h>
#define error(fmt, ...)                                                        \
  do {                                                                         \
    fprintf(stderr, fmt, ##__VA_ARGS__);                                       \
    exit(EXIT_FAILURE);                                                        \
  } while (0)

#define pexit(x)                                                               \
  do {                                                                         \
    perror(x);                                                                 \
    exit(EXIT_FAILURE);                                                        \
  } while (0)

typedef struct VM {
  // Allocated memory region?
  void *mem;
  uint64_t mem_size;
  // Support 1 vCPU only
  int vcpufd;
  // AN API to witch to guest mode and execute VM mode
  struct kvm_run *run;
} VM;
