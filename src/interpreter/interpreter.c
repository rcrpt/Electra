#include "include/interpreter.h"
#include "include/parser.h"
#include <stdio.h>

// Function for executing parsed code
void execute(const char *code) {
    // Initialize the lexer with the input code
    init_lexer(code);

    // Parse the code
    parse(code);

    // You can add additional steps here if needed,
    // such as interpreting or executing the parsed AST
}