/** -*- tab-width : 2 -*-
 * parser definition for vm_stat output.
 *
 * Copyright(C) 2015 Hiroyoshi Kurohara(Microgadget,inc.).
 * E-mail: kurohara@yk.rim.or.jp, kurohara@microgadget-inc.com
 * Lisenced under MIT the lincense.
 */

/**
%lex

%%

/lex
 **/

%options flex

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
	  { $$ = [ $1.value ]; }
	| symbollist SYMBOL
	  { $1.push($2.value); $$ = $1; }
	| symbollist COMPWORD
	  { $1.push($2.value); $$ = $1; }
	| symbollist NUMBERNAME
	  { $1.push($2.value); $$ = $1; }
	;

datalist
	: data NL
	  { yy.controller.dsSend($1); }
	| datalist data NL
	  { yy.controller.dsSend($2); }
	;

data
	: IVAL
	  { yy.keyindex = 0; $$ = {}; $$[yy.keys[yy.keyindex++]] = $1.value; }
	| FVAL
	  { yy.keyindex = 0; $$ = {}; $$[yy.keys[yy.keyindex++]] = $1.value; }
	| data IVAL
	  { $1[yy.keys[yy.keyindex++]] = $2.value; $$ = $1; }
	| data FVAL
	  { $1[yy.keys[yy.keyindex++]] = $2.value; $$ = $1; }
	;
%%

