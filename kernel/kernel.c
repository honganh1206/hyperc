#include <mm/translate.h>
#include <mm/kmalloc.h>
#include <stdint.h>

// NOTE: Cannot set as main because different params
int kernel_main(void *addr, uint64_t len, uint64_t argc, char *argv[]) {
  init_pagetable();
  init_allocator((void *)((uint64_t)addr | KERNEL_BASE_OFFSET), len);
  // if (register_syscall() != 0)
  //   return 1;
  // switch_user(argc, argv);
  return 0;
}
