bison -y -d python.y 
flex python.l
gcc -c y.tab.c lex.yy.c
gcc y.tab.o lex.yy.o -o parser
./parser Python.py