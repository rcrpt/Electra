CC = gcc
CFLAGS = -Wall -Wextra -std=c99
SRC_DIR = src
INC_DIR = include
BIN_DIR = bin

# Ensure bin directory exists
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

all: $(BIN_DIR)/simple_lang

$(BIN_DIR)/simple_lang: $(BIN_DIR)/main.o $(BIN_DIR)/lexer.o $(BIN_DIR)/parser.o $(BIN_DIR)/interpreter.o | $(BIN_DIR)
	$(CC) $(CFLAGS) -o $(BIN_DIR)/simple_lang $(BIN_DIR)/main.o $(BIN_DIR)/lexer.o $(BIN_DIR)/parser.o $(BIN_DIR)/interpreter.o

$(BIN_DIR)/main.o: $(SRC_DIR)/Electra.c $(INC_DIR)/parser.h $(INC_DIR)/lexer.h $(INC_DIR)/interpreter.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/Electra.c -o $(BIN_DIR)/main.o

$(BIN_DIR)/lexer.o: $(SRC_DIR)/lexer.c $(INC_DIR)/lexer.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/lexer.c -o $(BIN_DIR)/lexer.o

$(BIN_DIR)/parser.o: $(SRC_DIR)/parser.c $(INC_DIR)/parser.h $(INC_DIR)/lexer.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/parser.c -o $(BIN_DIR)/parser.o

$(BIN_DIR)/interpreter.o: $(SRC_DIR)/interpreter.c $(INC_DIR)/interpreter.h $(INC_DIR)/parser.h $(INC_DIR)/lexer.h | $(BIN_DIR)
	$(CC) $(CFLAGS) -c $(SRC_DIR)/interpreter.c -o $(BIN_DIR)/interpreter.o

clean:
	rm -rf $(BIN_DIR)