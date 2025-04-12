# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude
LDFLAGS =

# Directories
SRC_DIR = src
INC_DIR = include

# Source files
SRCS = main.c lexer.c parser.c interpreter.c

# Object files
OBJS = $(SRCS:.c=.o)

# Target executable
TARGET = simple_lang

# Detect OS and adjust flags accordingly
ifeq ($(OS),Windows_NT)
    CFLAGS += -Wl,--entry=main
else
    LDFLAGS += -no-pie -e main
endif

# Default build target
all: $(TARGET)

# Link the object files to create the executable
$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $@

# Compile .c files to .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean
