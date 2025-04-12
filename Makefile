CC = gcc
CFLAGS = -Wall -Wextra -std=c99 -Iinclude
SRC_DIR = src
INC_DIR = include

# Remove the "-e main" flag for non-Windows platforms
ifeq ($(OS),Windows_NT)
    CFLAGS += -Wl,--entry=main
else
    LDFLAGS += -no-pie
endif

all: simple_lang

simple_lang: main.o lexer.o parser.o interpreter.o
	$(CC) $(CFLAGS) $(LDFLAGS) -o simple_lang main.o lexer.o parser.o interpreter.o

main.o: src/Electra.c src/include/parser.h src/include/lex.h include/interpreter.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/Electra.c -o main.o

lexer.o: src/lexer.c src/include/lex.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/lexer.c -o lexer.o

parser.o: src/parser.c src/include/par.h src/include/lex.h
	$(CC) $(CFLAGS) -c src/parser.c -o parser.o

interpreter.o: src/interpreter/interpreter.c include/interpreter.h src/include/par.h src/include/lex.h
	$(CC) $(CFLAGS) -c src/interpreter/interpreter.c -o interpreter.o

clean:
	rm -f simple_lang main.o lexer.o parser.o interpreter.o
