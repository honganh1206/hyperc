#include <hypercalls/hp_open.h>
#include <mm/translate.h>
#include <hypercalls/hypercall_table.h>
#include <hypercalls/hypercall.h>

int hp_open(uint64_t paddr) {
    return hypercall(NR_HP_OPEN, (uint32_t) paddr);
}
