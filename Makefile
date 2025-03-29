CC = gcc
CFLAGS = -Wall

all: simple_lang

simple_lang: Electra.o lexer.o parser.o
	$(CC) $(CFLAGS) -o simple_lang main.o lexer.o parser.o

main.o: Electra.c parser.h lexer.h
	$(CC) $(CFLAGS) -c main.c

lexer.o: lexer.c lexer.h
	$(CC) $(CFLAGS) -c lexer.c

parser.o: parser.c parser.h lexer.h
	$(CC) $(CFLAGS) -c parser.c

clean:
	rm -f *.o simple_lang
