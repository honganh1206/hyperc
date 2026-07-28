CC := gcc
TARGET := kernel.bin
SRCS := entry.s kernel.c
# Placeholder for loose .o files
OBJS :=
SUBOBJS := syscalls/syscalls.a hypercalls/hypercalls.a mm/mm.a elf/elf.a utils/utils.a

# From left to right: 
# No C standard lib
# Optimize for file (blob loaded into fixed VM memory)
# Position-independent code (run no matter what address it is loaded at)
# Intel ASM syntax (asm() function)
# Add current dir to header search?
CFLAGS := -Wall -Werror -nostdlib -Os -fPIE -pie -masm=intel -I.

# From left to right:
# No OS under kernel
# Do not let gcc swap call for example memcpy from stdlib
# Use custom linker
LDFLAGS := -ffreestanding -fno-builtin -Tlinker.script

# Do NOT delete object files
.PRECIOUS: %.o
all: $(TARGET)

# Xlinker passes next token straight to ld, skipping gcc
%.bin: $(SRCS) $(OBJS) $(SUBOBJS)
	$(CC) $(CFLAGS) $^ -o $@ -Xlinker --oformat=binary $(LDFLAGS)

# Build .o file from .c
# and keep track of .h with .d
%o: %.c
	$(CC) $(CFLAGS) -c -MMD -MP $< -o $@

%.o: %.s
	$(AS) $< -o $@

$(SUBOBJS): FORCE
	$(MAKE) -C $(dir $@) $(notdir $@)

.PHONY: clean

# Recurse-clean children (subdirs) and self (root)
clean:
	dirname $(SUBOBJS) | xargs -n 1 $(MAKE) clean -C
	$(RM) $(OBJS) $(TARGET) $(DEPS)

# Always run trick
FORCE:
