#include <hypercalls/hypercall.h>
#include <stdint.h>

int hypercall(unsigned short port, uint32_t data) {
    int ret = 0;
    asm(
        "mov dx, %[port];"
        "mov eax, %[data];"
        "out dx, eax;" // argument for kind of hypercalls
        "in eax, dx;" // kind of hypercalls is intended to call (like open?)
        "mov %[ret], eax;"
        : [ret]"=r"(ret) // output
        : [port]"r"(port), [data]"r"(data) // input (args)
        : "rax", "rdx"
    );
    return ret;
}
