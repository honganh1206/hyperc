#ifndef ELF_H
#define ELF_H

#include <stdint.h>

#define EI_NIDENT 16

typedef uint16_t __u16;
typedef uint32_t __u32;
typedef uint64_t __u64;
typedef int16_t __s16;
typedef int32_t __s32;
typedef int64_t __s64;

/* 64-bit ELF base types. */
typedef __u64 Elf64_Addr; // Memory address
typedef __u16 Elf64_Half; // Small values like counts, flags
typedef __s16 Elf64_SHalf; // Signed small values
typedef __u64 Elf64_Off; // File offset
typedef __s32 Elf64_Sword; // Signed 32-bit words
typedef __u32 Elf64_Word; // Generic 32-bit words
typedef __u64 Elf64_Xword; // Large unsigned values
typedef __s64 Elf64_Sxword; // Large signed values

#define ET_EXEC 2
#define ET_DYN 3

// Main header (overall structure of ELF) at the beginning of ELF file
typedef struct elf64_hdr {
    // Magic number
    unsigned char e_ident[EI_NIDENT];
    // File type
    Elf64_Half e_type;
    // CPU architecture
    Elf64_Half e_machine;
    Elf64_Word e_version;
    // Entry point address
    Elf64_Addr e_entry;
    // Byte offset to the 1st program header (pointing to the 1st program)
    Elf64_Off e_phoff;
    // Byte offset to section header? (Debugging info)
    Elf64_Off e_shoff;
    Elf64_Word e_flags;
    Elf64_Half e_ehsize;
    // Size of EACH program header entry
    Elf64_Half e_phentsize;
    // Number of program headers
    Elf64_Half e_phnum;
    Elf64_Half e_shentsize;
    Elf64_Half e_shnum;
    Elf64_Half e_shstrndx;
} Elf64_Ehdr;

/* p_type */
#define PT_LOAD 1

/* p_flags */
#define PF_R 0x4
#define PF_W 0x2
#define PF_X 0x1

// Program header within ELF file
typedef struct elf64_phdr {
    // Type of segment e.g., PT_LOAD for loadable code/data
    Elf64_Word p_type;
    // Permissions
    Elf64_Word p_flags;
    // Location of segment data in the file
    Elf64_Off p_offset;
    // Virtual address where the segment should be loaded
    Elf64_Addr p_vaddr;
    // Physical address used in bootloaders/kernels
    Elf64_Addr p_paddr;
    // Segment size in the file
    Elf64_Xword p_filesz;
    // Segment size in memory
    Elf64_Xword p_memsz;
    // Memory alignment requirement
    Elf64_Xword p_align;
} Elf64_Phdr;

#endif
