%option noyywrap
%{
#include<stdio.h>
#include<stdlib.h>
#include "program.tab.h"
//#include "programFunc.h"
#define YY_DECL int yylex()
extern int lineNumber; 

%}
%%
"BEGIN"		{ return begin;}
"END" 		{ return END; }
"IF"		{  return IF;}
"ELSE"		{ return ELSE; }
"ELSEIF"	{ return ELSEIF; }
"ENDIF"		{ return ENDIF;}
"ECHO"		{ return echo;}
"THEN"		{ return THEN; }
"("		{ return OP; }
")"		{return  CP;}
"INT"		{ return INT;}
"FLOAT"		{ return FLOAT;}
"BOOL" 		{ return BOOL;}
"STRING"	{ return STRING; }
\'(\\.|[^'])*\'	{ return QUOTED_STRING;}
"'"		{ return QUOTE;}
""		{ return EPSILON; }
"=="		{ return EQUAL_OPER; }
"<="		{ return LESS_EQUAL_OPER;}
"<"		{ return LESS_OPER;}
">="		{ return GREAT_EQUAL_OPER;}
">"		{ return GREAT_OPER; } 
"!="		{ return NOT_EQUAL_OPER; } 
"="		{ return ASSIGN;}
";"		{ return SEMICOLON;} 
"true"		{ return TRUE;}
"false"		{ return FALSE;}
"\\".		{ }
[0-9]+			{ return NUMBER;}
[0-9]*\.[0-9+]		{ return FLOAT_NUMBER;}
[a-zA-Z]{2,}		{ return STRING_VALUE;}
[a-zA-Z][a-zA-Z0-9]*	{  return IDF;}
\n			{ ++lineNumber; }
[ \t]			{ } 
%%

