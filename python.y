%{

#include <stdio.h>

int yylex();
int yyerror(char *s);

extern FILE *yyin;
extern FILE **yyout;

%}

%token NEWLINE TYPE_COMMENT NAME NUMBER INDENT DEDENT
%token IMPORT IMPORT_FROM

%union {
    char *a;
    float f;
    int i;
}

%%

prog:
    single_input | single_input prog
;

single_input: simple_stmt | NEWLINE { printf("Newline\n"); }
;

simple_stmt: small_stmt | small_stmt NEWLINE;

small_stmt: import_stmt;
import_stmt: import_name;
import_name: IMPORT NAME { printf("Importing module %s\n", yylval.a); };


%% 

int yyerror(char *s) {
    extern int yylineno;
    fprintf(stderr, "%s in line %d\n", s, yylineno);
    return 0;
}

int main(int argc, char **argv) {
    printf("Python Set Parser\n\n");
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
    } else {
        yyin = stdin;
    }
    yyparse();
    return 0;
}