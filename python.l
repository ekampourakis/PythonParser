%{

#include <stdio.h>
#include "y.tab.h"

void showError();

%}

%option noyywrap yylineno

NUMBERS ([0-9])+
FLOATS [-+]?[0-9]*\.?[0-9]+
NAME ([a-zA-Z0-9_])+
COMMENT "#".*
OP [-+/*]

%%

"import" { return (IMPORT); }
"from" { return (IMPORT_FROM); }
"class" { return (CLASS); }
"def" { return (DEF); }
"()" { return (ARGS); }
":" { return (DELI); }
"." { return (DOT); }
"if"|"elif"|"else" { return (TEST); }
"<"|">"|"=="|">="|"<="|"<>"|"!=" { return (TESTOP); }
"for" { return (FOR); }
"in" { return (IN); }
{NUMBERS} { yylval.i = atoi(yytext); return (INT); }
{FLOATS} { yylval.f = atof(yytext);return (FLOAT); }
{COMMENT} { return (TYPE_COMMENT); }
{NAME} { yylval.a = yytext; return (NAME); }
{OP} { return (OP); }
"\n"|"\r\n" { return (NEWLINE); }
"\t"|"  "|"    " { return (INDENT); }
"=" { return (ASSIGNOP); }
. { showError(); }

%%

void showError() {
    // printf("Unrecognized token\n");
}