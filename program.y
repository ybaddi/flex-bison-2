%{
#include<stdio.h>
#include<stdlib.h>
//#include "programFunc.h"
extern int yylex();
extern int yyparse();
void yyerror(char* s);

int lineNumber; 
extern FILE * yyin; 
%}
%token ASSIGN SEMICOLON 
%token TRUE FALSE 
%token  NUMBER FLOAT_NUMBER STRING_VALUE EOL
%token begin END IF ELSE ELSEIF ENDIF echo THEN
%token INT FLOAT BOOL STRING QUOTED_STRING IDF QUOTE EPSILON 
%token OP CP
%token EQUAL_OPER LESS_EQUAL_OPER LESS_OPER GREAT_EQUAL_OPER GREAT_OPER NOT_EQUAL_OPER 
%start prog
%%

prog: begin list_decl END begin list_inst END	{ printf("Clean Program !!\n"); }
    ;
list_decl: decl
	 | list_decl decl
	;
list_inst: inst
	 | list_inst inst
	;
decl: type IDF ASSIGN const SEMICOLON	{  printf("Declaration with instanciation in line %d\n",lineNumber);}
    | type IDF SEMICOLON	{ printf("Declaration without instanciation in line %d\n",lineNumber);  }
	;
type : INT 	{}
     	| FLOAT {}
     	| BOOL 	{}
     	| STRING {}
     ;
const : TRUE 
      	| FALSE 
	| NUMBER 
	| FLOAT_NUMBER
	| QUOTED_STRING
      ;
/* quoted_string :  QUOTE  IDF QUOTE   	{}	     ; */ 

inst : IDF ASSIGN const SEMICOLON 	{ printf("Instruction\n"); }
    	 | IDF ASSIGN  inssub SEMICOLON { printf("Instrucation\n"); }
    	 | IF OP IDF op_logic inssub CP THEN list_inst ENDIF { printf("IF statement in line %d\n",lineNumber);  } 
	 | IF OP IDF op_logic inssub CP THEN list_inst ELSE list_inst ENDIF 	{ printf("IF/ELSE  statment in line %d\n",lineNumber);}
	 | IF OP IDF op_logic inssub CP THEN list_inst ELSEIF list_inst ENDIF { printf("IF/ELSEIF  statement in line %d\n",lineNumber);}
	 | echo aux SEMICOLON 	{ printf("ECHO statement in line %d\n",lineNumber);}
	;
op_logic :  EQUAL_OPER 
	| LESS_EQUAL_OPER 
	| LESS_OPER 	
	| GREAT_EQUAL_OPER 
	| GREAT_OPER 
	| NOT_EQUAL_OPER 
	 ;
inssub: MULT ADDSUBAUX {}
      	| aux
      ;
ADDSUBAUX : '-' MULT ADDSUBAUX
ADDSUBAUX : '+' MULT ADDSUBAUX
/*DDSUBAUX : epsilon*/
	;
MULT: aux MULT aux
MULT : '*'  aux MULT aux
/*MULT : epsilon*/
	;

aux : IDF 	{}
    | NUMBER 	{}
    | OP inssub CP
	;
%%
int main(int argc, char* argv[]){
	if(argc > 1 ) yyin = fopen(argv[1], "r"); 
	lineNumber = 1;
	if(!yyparse()) printf("THE END\n");
	return 0;

}
void yyerror(char* s){
	printf("line %d : %s",lineNumber,s);
}


%{
#include<stdio.h>
#include<stdlib.h>
//#include "programFunc.h"
extern int yylex();
extern int yyparse();
void yyerror(char* s);

int lineNumber; 
extern FILE * yyin; 
%}
%token ASSIGN SEMICOLON 
%token TRUE FALSE 
%token  NUMBER FLOAT_NUMBER STRING_VALUE EOL
%token begin END IF ELSE ELSEIF ENDIF echo THEN
%token INT FLOAT BOOL STRING QUOTED_STRING IDF QUOTE EPSILON 
%token OP CP
%token EQUAL_OPER LESS_EQUAL_OPER LESS_OPER GREAT_EQUAL_OPER GREAT_OPER NOT_EQUAL_OPER 
%start prog
%%

prog: begin list_decl END begin list_inst END	{ printf("Clean Program !!\n"); }
    ;
list_decl: decl
	 | list_decl decl
	;
list_inst: inst
	 | list_inst inst
	;
decl: type IDF ASSIGN const SEMICOLON	{  printf("Declaration with instanciation in line %d\n",lineNumber);}
    | type IDF SEMICOLON	{ printf("Declaration without instanciation in line %d\n",lineNumber);  }
	;
type : INT 	{}
     	| FLOAT {}
     	| BOOL 	{}
     	| STRING {}
     ;
const : TRUE 
      	| FALSE 
	| NUMBER 
	| FLOAT_NUMBER
	| QUOTED_STRING
      ;
/* quoted_string :  QUOTE  IDF QUOTE   	{}	     ; */ 

inst : IDF ASSIGN const SEMICOLON 	{ printf("Instruction\n"); }
    	 | IDF ASSIGN  inssub SEMICOLON { printf("Instrucation\n"); }
    	 | IF OP IDF op_logic inssub CP THEN list_inst ENDIF { printf("IF statement in line %d\n",lineNumber);  } 
	 | IF OP IDF op_logic inssub CP THEN list_inst ELSE list_inst ENDIF 	{ printf("IF/ELSE  statment in line %d\n",lineNumber);}
	 | IF OP IDF op_logic inssub CP THEN list_inst ELSEIF list_inst ENDIF { printf("IF/ELSEIF  statement in line %d\n",lineNumber);}
	 | echo aux SEMICOLON 	{ printf("ECHO statement in line %d\n",lineNumber);}
	;
op_logic :  EQUAL_OPER 
	| LESS_EQUAL_OPER 
	| LESS_OPER 	
	| GREAT_EQUAL_OPER 
	| GREAT_OPER 
	| NOT_EQUAL_OPER 
	 ;
inssub: MULT ADDSUBAUX {}
      	| aux
      ;
ADDSUBAUX : '-' MULT ADDSUBAUX
ADDSUBAUX : '+' MULT ADDSUBAUX
/*DDSUBAUX : epsilon*/
	;
MULT: aux MULT aux
MULT : '*'  aux MULT aux
/*MULT : epsilon*/
	;

aux : IDF 	{}
    | NUMBER 	{}
    | OP inssub CP
	;
%%
int main(int argc, char* argv[]){
	if(argc > 1 ) yyin = fopen(argv[1], "r"); 
	lineNumber = 1;
	if(!yyparse()) printf("THE END\n");
	return 0;

}
void yyerror(char* s){
	printf("line %d : %s",lineNumber,s);
}


