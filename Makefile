# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude
LDFLAGS =

# Source files
SRCS = main.c lexer.c parser.c interpreter.c
OBJS = $(SRCS:.c=.o)

# Output binary
TARGET = simple_lang

# Platform-specific fixes
ifeq ($(OS),Windows_NT)
    LDFLAGS += -lmsvcrt
    # Avoid __main undefined issue in Windows
    CFLAGS += -Wl,--undefined=main
else
    LDFLAGS += -no-pie -e main
endif

# Default target
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean