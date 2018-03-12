%{
	#include "zoomjoystrong.tab.h"
	#include <stdio.h>
%}

%%

<<EOF>>				{yylval.str = strdup(yytext); return END; }
;					{return END_STATEMENT; }
(point)				{yylval.str = strdup(yytext); return POINT; }
(line)				{yylval.str = strdup(yytext); return LINE; }
(circle)			{yylval.str = strdup(yytext); return CIRCLE; }
(rectangle)			{yylval.str = strdup(yytext); return RECTANGLE; }
(set_color)			{yylval.str = strdup(yytext); return SET_COLOR; }
[0-9]*\.?[0-9]*		{yylval.i = atoi(yytext); return FLOAT; }
[0-9]+				{yylval.i = atoi(yytext); return INT; }



%%

int main(int argc, char** argv){
	yylex();
	return 0;
}

