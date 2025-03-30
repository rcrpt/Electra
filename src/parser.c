#include "include/parser.h"
#include "include/lexer.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[256];
    int value;
} Variable;

// Function for parsing the input code
void parse(const char *input) {
    Token token;
    while ((token = get_next_token()).type != TOKEN_EOF) {
        if (token.type == TOKEN_PRINT) {
            printf("Parsed print statement\n");
            // Handle the print statement execution here
        }
        // Handle other tokens...
    }
}

Variable vars[100];
int var_count = 0;

int get_variable_value(const char *name) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(vars[i].name, name) == 0) {
            return vars[i].value;
        }
    }
    return 0;
}

void set_variable_value(const char *name, int value) {
    for (int i = 0; i < var_count; i++) {
        if (strcmp(vars[i].name, name) == 0) {
            vars[i].value = value;
            return;
        }
    }
    strcpy(vars[var_count].name, name);
    vars[var_count].value = value;
    var_count++;
}

void execute(const char *code) {
    init_lexer(code);
    Token token;

    while ((token = get_next_token()).type != TOKEN_EOF) {
        if (token.type == TOKEN_IDENTIFIER) {
            char var_name[256];
            strcpy(var_name, token.value);

            Token next_token = get_next_token();
            if (next_token.type == TOKEN_ASSIGN) {
                Token value_token = get_next_token();
                if (value_token.type == TOKEN_NUMBER) {
                    set_variable_value(var_name, atoi(value_token.value));
                }
            }
        } else if (token.type == TOKEN_PRINT) {
            Token next_token = get_next_token();
            if (next_token.type == TOKEN_IDENTIFIER) {
                printf("%s = %d\n", next_token.value, get_variable_value(next_token.value));
            }
        }
    }
}
