%{
	#include <stdio.h>
	void yyerror(const char* msg);
	int yylex();
	void line(int x, int y, int u, int v);
	void point(int x, int y);
	void circle(int x, int y, int r);
	void rectangle(int x, int y, int w, int h);
	void set_color(int r, int g, int b);
%}

%error-verbose
%start zoomjoystrong

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token FLOAT
%token INT

%%

line: LINE INT INT INT INT
	{line($2, $3, $4, $5); }
;

point: POINT INT INT
	{point($2, $3); }
;

circle: CIRCLE INT INT INT
	{circle($2, $3, $4); }
;

rectangle: RECTANGLE INT INT INT INT
	{rectangle($2, $3, $4, $5); }
;

set_color: SET_COLOR INT INT INT
	{set_color($2, $3, $4); }
;

end: END
	{exit(1); }
;

%%

int main(int argc, char** argv){
	yyparse();
	return 0;
}

void yyerror(const char* msg){
	fprintf(stderr, "ERROR! %s\n", msg);
}

void line(int x, int y, int u, int v){
	/*not sure what to do for these*/
}
void point(int x, int y){

}
void circle(int x, int y, int r){
	
}
void rectangle(int x, int y, int w, int h){

}
void set_color(int r, int g, int b){
	if(r > 255 || r < 0){
		printf("ERROR! : red is not between 0-255");
	}
	if(g > 255 || g < 0){
		printf("ERROR! : green is not between 0-255");
	}
	if(b > 255 || b < 0){
		printf("ERROR! : blue is not between 0-255");
	}
	else{
		/*sets color*/
	}
}







