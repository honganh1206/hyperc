#ifndef HYPERCALL_TABLE_H
#define HYPERCALL_TABLE_H

// Unique namespace for hypercall numbers
// to avoid colliding with regular system call numbers
#define HP_NR_MARK 0x8000
#define NR_HP_OPEN (HP_NR_MARK | 0)
#define NR_HP_READ (HP_NR_MARK | 1)
#define NR_HP_WRITE (HP_NR_MARK | 2)
#define NR_HP_CLOSE (HP_NR_MARK | 3)
#define NR_HP_LSEEK (HP_NR_MARK | 4)
#define NR_HP_EXIT (HP_NR_MARK | 5)

#define NR_HP_PANIC (HP_NR_MARK | 0x7fff)

#endif
