#include "include/lexer.h"
#include <stdio.h>

int main() {
    char code[] = 
        "x = 10\n"
        "y = 20\n"
        "print x\n"
        "print y\n";

    printf("Executing code...\n");
    execute(code);
    return 0;
}

