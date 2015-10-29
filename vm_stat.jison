/**

%lex

%%
/lex

*/
 
%start stat

%%

stat
	: block EOF
	  { return; }
	;

block
	: greetings header datalist
	  {
	  }
	| block greetings header datalist
	;

greetings
	: TAGSYMBOL '(' SYMBOL SYMBOL SYMBOL IVAL SYMBOL ')' NL
	  {
		yy.controller.dsConnect();
	  }
	;

header
	: symbollist NL
	  { yy.keys = $1; }
	;

symbollist
	: SYMBOL
	  { $$ = [ $1 ]; }
	| symbollist SYMBOL
	  { $1.push($2); $$ = $1; }
	| symbollist COMPWORD
	  { $1.push($2); $$ = $1; }
	| symbollist NUMBERNAME
	  { $1.push($2); $$ = $1; }
	;

datalist
	: data NL
	  { yy.controller.dsSend($1); }
	| datalist data NL
	  { yy.controller.dsSend($2); }
	;

data
	: IVAL
	  { yy.keyindex = 0; $$ = {}; $$[yy.keys[yy.keyindex++]] = yy.yylval.value; }
	| FVAL
	  { yy.keyindex = 0; $$ = {}; $$[yy.keys[yy.keyindex++]] = yy.yylval.value; }
	| data IVAL
	  { $1[yy.keys[yy.keyindex++]] = yy.yylval.value; $$ = $1; }
	| data FVAL
	  { $1[yy.keys[yy.keyindex++]] = yy.yylval.value; $$ = $1; }
	;
%%

