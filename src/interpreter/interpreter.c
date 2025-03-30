// interpreter.c
#include "interpreter.h"
#include "parser.h"
#include <stdio.h>

void interpret(const char *code) {  // Renamed from execute to interpret
    // Initialize the lexer with the input code
    init_lexer(code);

    // Parse the code
    parse(code);

    // You can add additional steps here if needed,
    // such as interpreting or executing the parsed AST
}
