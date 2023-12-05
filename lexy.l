%{
#include "bison2.tab.h"
%}

%option noyywrap

%%
[\t]
[a-zA-Z][0-9a-zA-Z]* {printf(yytext);printf(" ");return ID;}
[0-9]+ {printf(yytext);printf(" ");return NUM;}
"-" {printf(yytext);printf(" ");return SUB;}
"+" {printf(yytext);printf(" ");return ADD;}
"*" {printf(yytext);printf(" ");return MUL;}
"/" {printf(yytext);printf(" ");return DIV;}
"%" {printf(yytext);printf(" ");return MOD;}
"=" {printf(yytext);printf(" ");return EQU;}
";" {printf(yytext);printf(" ");return SEMI;}
"(" {printf(yytext);printf(" ");return PARL;}
")" {printf(yytext);printf(" ");return PARR;}
\n {printf(yytext);return EOL;}
. 
%%
