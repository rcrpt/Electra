#include "include/lexer.h"
#include <ctype.h>
#include <string.h>
#include <stdio.h>

static const char *src;
static int pos;

void init_lexer(const char *input) {
    src = input;
    pos = 0;
}

Token get_next_token() {
    Token token;
    token.type = TOKEN_EOF;
    token.value[0] = '\0';

    while (isspace(src[pos])) {
        pos++;
    }

    if (src[pos] == '\0') {
        token.type = TOKEN_EOF;
        return token;
    }

    if (isdigit(src[pos])) {
        int start_pos = pos;
        while (isdigit(src[pos])) {
            pos++;
        }
        strncpy(token.value, src + start_pos, pos - start_pos);
        token.value[pos - start_pos] = '\0';
        token.type = TOKEN_NUMBER;
        return token;
    }

    if (isalpha(src[pos])) {
        int start_pos = pos;
        while (isalnum(src[pos])) {
            pos++;
        }
        strncpy(token.value, src + start_pos, pos - start_pos);
        token.value[pos - start_pos] = '\0';

        if (strcmp(token.value, "print") == 0) {
            token.type = TOKEN_PRINT;
        } else {
            token.type = TOKEN_IDENTIFIER;
        }
        return token;
    }

    if (src[pos] == '=') {
        token.type = TOKEN_ASSIGN;
        token.value[0] = '=';
        token.value[1] = '\0';
        pos++;
        return token;
    }

    if (src[pos] == '+' || src[pos] == '-' || src[pos] == '*' || src[pos] == '/') {
        token.type = TOKEN_OPERATOR;
        token.value[0] = src[pos];
        token.value[1] = '\0';
        pos++;
        return token;
    }

    token.type = TOKEN_EOF;
    return token;
}