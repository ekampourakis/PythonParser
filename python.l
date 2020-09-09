%{

#include <stdio.h>
#include "y.tab.h"

void showError();

%}

%option noyywrap
%option yylineno

NUMBERS ([0-9])+
FLOATS [-+]?[0-9]*\.?[0-9]+
ALPHA ([a-zA-Z])+
ALPHANUM ([a-zA-Z0-9_])+

%%

"import" { return (IMPORT); }
{NUMBERS} { yylval.i = atoi(yytext); return (NUMBER); }
{FLOATS} { yylval.f = atof(yytext);return (NUMBER); }
{ALPHANUM} { yylval.a = yytext; return (NAME); }
"\n" { return (NEWLINE); }
"\r\n" { return (NEWLINE); }

. { showError(); }

%%

void showError() {
    printf("Unrecognized token\n");
}