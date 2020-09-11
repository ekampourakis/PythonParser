/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_Y_TAB_H_INCLUDED
# define YY_YY_Y_TAB_H_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    NEWLINE = 258,
    TYPE_COMMENT = 259,
    ALPHA = 260,
    NAME = 261,
    INT = 262,
    FLOAT = 263,
    INDENT = 264,
    TEST = 265,
    ELIF = 266,
    ELSE = 267,
    TESTOP = 268,
    IMPORT = 269,
    IMPORT_FROM = 270,
    ASSIGNOP = 271,
    CLASS = 272,
    ARGS = 273,
    DELI = 274,
    DEF = 275,
    DOT = 276,
    OP = 277,
    FOR = 278,
    IN = 279
  };
#endif
/* Tokens.  */
#define NEWLINE 258
#define TYPE_COMMENT 259
#define ALPHA 260
#define NAME 261
#define INT 262
#define FLOAT 263
#define INDENT 264
#define TEST 265
#define ELIF 266
#define ELSE 267
#define TESTOP 268
#define IMPORT 269
#define IMPORT_FROM 270
#define ASSIGNOP 271
#define CLASS 272
#define ARGS 273
#define DELI 274
#define DEF 275
#define DOT 276
#define OP 277
#define FOR 278
#define IN 279

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 21 "python.y" /* yacc.c:1909  */

    char *a;
    float f;
    int i;

#line 108 "y.tab.h" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_Y_TAB_H_INCLUDED  */
