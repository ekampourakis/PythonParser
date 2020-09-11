%{

#include <stdio.h>

int yylex();
int yyerror(char *s);

extern FILE *yyin;
extern FILE **yyout;
extern int yylineno;

%}

%token NEWLINE TYPE_COMMENT ALPHA NAME INT FLOAT INDENT TEST ELIF ELSE TESTOP 
%token IMPORT IMPORT_FROM ASSIGNOP CLASS ARGS DELI DEF DOT OP FOR IN

%type <a> NAME
%type <f> FLOAT
%type <i> INT

%union {
    char *a;
    float f;
    int i;
}

%%

prog: single_input | single_input prog;

single_input: stmt | NEWLINE { printf("Newline on line %d\n", yylineno - 1); };
stmt: simple_stmt | compount_stmt 
    | TYPE_COMMENT NEWLINE{ printf("Comment on line %d\n", yylineno - 1); };
simple_stmt: small_stmt NEWLINE | INDENT;
small_stmt: import_stmt | assign_stmt | call;
import_stmt: import_name | import_from import_name;
import_name: IMPORT NAME { printf("Importing module %s\n", $2); };
import_from: IMPORT_FROM NAME { printf("From module %s\n", $2); };
assign_stmt: NAME ASSIGNOP term { printf("Assigning %s\n", $1); };
term: INT | FLOAT | call | NAME OP term;
compount_stmt: classdef | funcdef | if_stmt | for_stmt;
classdef: CLASS NAME ARGS DELI NEWLINE { printf("Class definition\n"); };
funcdef: DEF NAME ARGS DELI NEWLINE { printf("Function definition\n"); };
call: NAME ARGS { printf("Calling %s\n", $1); }| NAME DOT call;
if_stmt: TEST NAME TESTOP term DELI NEWLINE { printf("If statement\n"); }
    | TEST DELI NEWLINE { printf("Else statement\n"); };
for_stmt: FOR NAME IN term DELI NEWLINE { printf("For statement\n"); }

%% 

int yyerror(char *s) {
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