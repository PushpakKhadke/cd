%{
#include <stdio.h>
#include <string.h>
int yylex();
void yyerror(const char *s);
%}

%union {
    char vname[10];
}

%token <vname> NAME

%%
line: NAME '=' expression {
    printf("MOV %s, AX\n", $1);
};

expression: NAME '+' NAME {
    printf("MOV AX, %s\n", $1);
    printf("ADD AX, %s\n", $3);
}
| NAME {
    printf("MOV AX, %s\n", $1);
}
;

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    yyparse();
    return 0;
}

