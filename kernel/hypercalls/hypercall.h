#ifndef HYPERCALL_H
#define HYPERCALL_H

#include <stdint.h>

// Why the param types?
int hypercall(unsigned short port, uint32_t data);

#endif
