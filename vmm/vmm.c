#include <asm/kvm.h>
#include <fcntl.h>
#include <linux/kvm.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/types.h>

#include "definition.h"

// Start of free memory
#define PS_LIMIT (0x200000)
// 16 KiB space reserved for kernel stack
#define KERNEL_STACK_SIZE (0x4000)

// setup_paging() and init_pagetable() in kernel/mm/translate.c uses 5 pages in
// total 1 for PML4, 1 for PDPT, 1 for page directory, 2 for page tables
#define PAGE_TABLE_SIZE (0x5000)
// Raw kernel image size
#define MAX_KERNEL_SIZE (PS_LIMIT - PAGE_TABLE_SIZE - KERNEL_STACK_SIZE)
// 4 MiB memory for the VM
#define MEM_SIZE (PS_LIMIT * 0x2)

// Guest physical memory
//
// 0x000000 ┌──────────────────────────────┐
//          │ kernel image                 │
// 0x1f7000 ├──────────────────────────────┤
//          │ page tables, 0x5000 bytes    │
// 0x1fc000 ├──────────────────────────────┤
//          │ kernel stack, 0x4000 bytes   │
// 0x200000 ├──────────────────────────────┤ ← PS_LIMIT, start of free memory
//          │ free physical memory         │
// 0x400000 └──────────────────────────────┘ ← MEM_SIZE

void read_file(const char *filename, uint8_t **content_ptr, size_t *size_ptr) {
  // Read binary mode
  FILE *f = fopen(filename, "rb");
  if (f == NULL)
    error("Open file '%s' failed.\n", filename);
  // Move file reading cursor till EOF?
  if (fseek(f, 0, SEEK_END) < 0)
    pexit("fseek(SEEK_END)");

  // Return position of file cursor
  size_t size = ftell(f);
  if (size == 0)
    error("Empty file '%s'. \n", filename);
  if (fseek(f, 0, SEEK_SET) < 0)
    pexit("fseek(SEEK_SET)");

  // Pointer to the content array
  uint8_t *content = (uint8_t *)malloc(size);
  if (content == NULL)
    error("read_file: Cannot allocate memory\n");
  if (fread(content, 1, size, f) != size)
    error("read_file: Unexpected EOF\n");

  fclose(f);
  *content_ptr = content;
  *size_ptr = size;
}

/*
 * rip = entry point
 * rsp = PS_LIMIT (max address can be used?)
 * rdi = PS_LIMIT(start of free/unpaging physical pages)
 * rsi = MEM_SIZE - rdi (total length of free pages)
 * Kernel uses rdi and rsi to initialize its memory allocator?
 * */
void setup_regs(VM *vm, size_t entry) {
  struct kvm_regs regs;
  if (ioctl(vm->vcpufd, KVM_GET_REGS, &regs) < 0)
    pexit("ioctl(KVM_GET_REGS)");
  // NOTE: What is an entry here btw?
  regs.rip = entry;
  regs.rsp = PS_LIMIT;
}

int main(int argc, char *argv[]) {
  if (argc < 3) {
    printf("Usage: %s kernel.bin user.elf [user_args...]\n", argv[0]);
    exit(EXIT_FAILURE);
  }

  // Assembled code
  uint8_t *code;
  size_t len;
  // Read kernel binary path kernel.bin
  read_file(argv[1], &code, &len);
  if (len > MAX_KERNEL_SIZE)
    // NOTE: Why converting to void pointer?
    error("Kernel size exceeded, %zu > MAX_KERNEL_SIZE(%p).\n", len,
          (void *)MAX_KERNEL_SIZE);
  VM *vm = kvm_init(code, len);
  // Read user program path user.elf
  copy_argv(vm, argc - 2, &argv[2]);
  execute(vm);
}
