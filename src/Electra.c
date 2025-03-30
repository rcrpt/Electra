#include "../include/interpreter.h"
#include <stdio.h>

int main() {
    const char code[] = 
        "print x\n"
        "print y\n";

    execute(code);
    return 0;
}