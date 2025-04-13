#include "include/interpreter.h"
#include <stdio.h>

int main() {
    const char code[] = 
        "x = 1000000"
        "print x";

    execute(code);
    return 0;
}