#include "include/lexer.h"
#include <stdio.h>
#include <ctype.h>
#include <string.h>

static const char *src;
static int pos = 0;

void init_lexer(const char *input) {
    src = input;
    pos = 0;
}

Token get_next_token() {
    Token token = {TOKEN_EOF, ""};

    while (src[pos] == ' ' || src[pos] == '\t' || src[pos] == '\n') {
        pos++;
    }

    if (isdigit(src[pos])) {
        token.type = TOKEN_NUMBER;
        int i = 0;
        while (isdigit(src[pos])) {
            token.value[i++] = src[pos++];
        }
        token.value[i] = '\0';
        return token;
    }

    if (isalpha(src[pos])) {
        token.type = TOKEN_IDENTIFIER;
        int i = 0;
        while (isalnum(src[pos])) {
            token.value[i++] = src[pos++];
        }
        token.value[i] = '\0';
        if (strcmp(token.value, "print") == 0) {
            token.type = TOKEN_PRINT;
        }
        return token;
    }

    if (src[pos] == '=' || src[pos] == '+' || src[pos] == '-' || src[pos] == '*' || src[pos] == '/') {
        token.type = (src[pos] == '=') ? TOKEN_ASSIGN : TOKEN_OPERATOR;
        token.value[0] = src[pos++];
        token.value[1] = '\0';
        return token;
    }

    return token;
}
