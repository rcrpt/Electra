# Compiler and flags
CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -I$(INC_DIR)
LDFLAGS =

# Directories
SRC_DIR = src
INC_DIR = include

# OS-specific linker flags
ifeq ($(OS),Windows_NT)
    LDFLAGS += -Wl,--entry=main -lmsvcrt
else
    LDFLAGS += -no-pie
endif

# Output binary
TARGET = simple_lang

# Source files
SRCS = \
	$(SRC_DIR)/Electra.c \
	$(SRC_DIR)/lexer.c \
	$(SRC_DIR)/parser.c \
	$(SRC_DIR)/interpreter/interpreter.c

# Object files
OBJS = \
	main.o \
	lexer.o \
	parser.o \
	interpreter.o

# Default target
all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(OBJS) $(LDFLAGS) -o $(TARGET)

main.o: $(SRC_DIR)/Electra.c $(SRC_DIR)/include/parser.h $(SRC_DIR)/include/lex.h $(INC_DIR)/interpreter.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/Electra.c -o main.o

lexer.o: $(SRC_DIR)/lexer.c $(SRC_DIR)/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/lexer.c -o lexer.o

parser.o: $(SRC_DIR)/parser.c $(SRC_DIR)/include/par.h $(SRC_DIR)/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/parser.c -o parser.o

interpreter.o: $(SRC_DIR)/interpreter/interpreter.c $(INC_DIR)/interpreter.h $(SRC_DIR)/include/par.h $(SRC_DIR)/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/interpreter/interpreter.c -o interpreter.o

clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean