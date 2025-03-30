CC = gcc
CFLAGS = -Wall -Wextra -std=c99
SRC_DIR = src
INC_DIR = include

all: simple_lang

simple_lang: main.o lexer.o parser.o interpreter.o
	$(CC) $(CFLAGS) -o simple_lang main.o lexer.o parser.o interpreter.o

main.o: $(SRC_DIR)/Electra.c $(INC_DIR)/parser.h $(INC_DIR)/lexer.h $(INC_DIR)/interpreter.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/Electra.c -o main.o

lexer.o: $(SRC_DIR)/lexer.c $(INC_DIR)/lexer.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/lexer.c -o lexer.o

parser.o: $(SRC_DIR)/parser.c $(INC_DIR)/parser.h $(INC_DIR)/lexer.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/parser.c -o parser.o

interpreter.o: $(SRC_DIR)/interpreter.c $(INC_DIR)/interpreter.h $(INC_DIR)/parser.h $(INC_DIR)/lexer.h
	$(CC) $(CFLAGS) -c $(SRC_DIR)/interpreter.c -o interpreter.o

clean:
	rm -f simple_lang main.o lexer.o parser.o interpreter.o
