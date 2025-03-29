CC = gcc
CFLAGS = -Wall

all: simple_lang

simple_lang: bin/Electra.o lexer.o parser.o
	$(CC) $(CFLAGS) -o simple_lang main.o lexer.o parser.o

main.o: src/Electra.c include/parser.h include/lexer.h
	$(CC) $(CFLAGS) -c main.c

lexer.o: src/lexer.c include/lexer.h
	$(CC) $(CFLAGS) -c lexer.c

parser.o: src/parser.c include/parser.h include/lexer.h
	$(CC) $(CFLAGS) -c parser.c

clean:
	rm -f *.o simple_lang
