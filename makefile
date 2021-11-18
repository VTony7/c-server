SRCS    := server.c
TARGET  := server
OBJS    := $(SRCS:%.c=%.o)
DEPS    := $(SRCS:%.c=%.d)

CC      := gcc
CFLAGS  := -g -Wno-format-security -fno-stack-protector -std=gnu99 -O0
LFLAGS  := -static -g

all: $(TARGET)
-include $(DEPS)

$(TARGET): $(OBJS)
	$(CC) $(LFLAGS) -o $@ $^

%.o: %.c
	$(CC) -c $(CFLAGS) -MMD $<

clean:
	rm -f $(OBJS) $(TARGET) $(DEPS)
