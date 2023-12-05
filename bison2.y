%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
extern char* yytext;
extern FILE* yyin;
int yyparse();

#define YYSTYPE char*
%}

%token ID NUM PARL PARR EOL
%token ADD SUB MUL DIV MOD
%token EQU SEMI
%left ADD SUB MUL DIV MOD

%%
statements:
	| statements statement
	;

statement: assignment
	| expression
	;	

assignment: ID EQU exp SEMI EOL
	{
		printf("Assignment Detected \n");
		printf("Result: Pass\n\n");
	}
	| error SEMI EOL
	 {
		yyerrok;
		fprintf(stderr, "Improper assignment structure\n"); 
		printf("Result: Fail\n\n");
	}
	;

expression:  exp  EOL
        {
                printf("Expression Detected\n");
                printf("Result: Pass\n\n");
        }
        | error EOL
         {
		yyerrok; 
                fprintf(stderr, "Improper expression structure\n");
                printf("Result: Fail\n\n");
        }
        ;

exp: id
	| exp ADD PARL exp PARR
        | exp SUB PARL exp PARR
        | exp MUL PARL exp PARR
        | exp DIV PARL exp PARR
        | exp MOD PARL exp PARR 
	| exp ADD id
	| exp SUB id
	| exp MUL id
	| exp DIV id
	| exp MOD id
	;
id: ID
	| NUM
	;
%%
yyerror(const char* s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main(int argc, char** argv){
	
	if(argc > 1) {
		yyin = fopen(argv[1], "r");
		if(!yyin){
			fprintf(stderr, "Can't open file");
			return 1;
		}
	}
	else{
		fprintf(stderr, "Must pass in file for testing");
		return 1;	
	}

	yyparse();
	fclose(yyin);
	return 0;

}
