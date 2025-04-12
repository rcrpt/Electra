CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude
SRC_DIR = src
INC_DIR = include

ifeq ($(OS),Windows_NT)
    # Windows
    CFLAGS += -Wl,--entry=main
else
    # Linux
    LDFLAGS += -no-pie
endif

all: simple_lang

simple_lang: main.o lexer.o parser.o interpreter.o
	$(CC) $(LDFLAGS) -o simple_lang main.o lexer.o parser.o interpreter.o

main.o: $(SRC_DIR)/Electra.c $(SRC_DIR)/include/parser.h $(SRC_DIR)/include/lex.h $(INC_DIR)/interpreter.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/Electra.c -o main.o

lexer.o: $(SRC_DIR)/lexer.c $(SRC_DIR)/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/lexer.c -o lexer.o

parser.o: $(SRC_DIR)/parser.c $(SRC_DIR)/include/par.h $(SRC_DIR)/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/parser.c -o parser.o

interpreter.o: $(SRC_DIR)/interpreter/interpreter.c $(INC_DIR)/interpreter.h $(SRC_DIR)/include/par.h $(SRC_DIR)/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/interpreter/interpreter.c -o interpreter.o

clean:
	rm -f simple_lang main.o lexer.o parser.o interpreter.o

.PHONY: all clean