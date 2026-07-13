CSRCS := $(wildcard *.c)
SSRCS := $(wildcard *.s)
OBJS := $(SSRCS:.s=.o) $(CSRCS:.c=.o)
DEPS := $(CSRCS:.c=.d)

# Point back to kernel root dir
# so <mm/kmalloc.h> still resolves
CFLAGS := -nostdlib -Os -Wall -Werror -fPIE -pie -masm=intel -I..

all: $(TARGET)

-include $(DEPS)

# Archive all .o into 1 lib
$(TARGET): $(OBJS)
	$(AR) rcs $@ $^

%.o: %.c %.h
	$(CC) $(CFLAGS) -c -MMD -MP $<

%.o: %.s
	$(AS) $^ -o $@

.PHONY: clean
clean:
	$(RM) $(DEPS) $(OBJS) $(TARGET)
