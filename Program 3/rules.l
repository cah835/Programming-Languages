/******************************************************************* 
purpose: CSE 4713 / 6713 Assignment 3 example recursive descent parser
 author: J. Edward Swan II
 *******************************************************************/
%option noyywrap
%{
#include "lexer.h"

int yyLine = 1;
%}

%%
 
 /* Keywords */ 

let       { return TOK_LET; }
read	  { return TOK_READ; }
print	  { return TOK_PRINT; }
if		  { return TOK_IF; }
while     { return TOK_WHILE; }
not		  { return TOK_NOT; }
else      { return TOK_ELSE; }
and 	  { return TOK_AND; }
or  	  { return TOK_OR; }

 /* Punctuation */

;         { return TOK_SEMICOLON; }
\(        { return TOK_OPENPAREN; }
\)        { return TOK_CLOSEPAREN; }
\{        { return TOK_OPENBRACE; }
\}        { return TOK_CLOSEBRACE; }


 /* Operators */

\+        { return TOK_PLUS; }
-         { return TOK_MINUS; }
\*        { return TOK_MULTIPLY; }
\/        { return TOK_DIVIDE; }
:=        { return TOK_ASSIGN; }
\< 		  { return TOK_LESSTHAN; }
\> 		  { return TOK_GREATERTHAN; }
\=\= { return TOK_EQUALTO; }

 /* Abstractions */

[A-Za-z][0-9A-Za-z_]*  { return TOK_IDENTIFIER; }
[0-9]+(\.[0-9]*)? 	   { return TOK_FLOATLIT; }
\".*\" 				   { return TOK_STRINGLIT; }

 /* Eat any whitespace */

[ \t\r]+               /* nop */

 /* Eat newline characters, AND increment line counter */

[\n]      { yyLine++; }

 /* Found an unknown character */

.         { return TOK_UNKNOWN; }

 /* Recognize end of file */

<<EOF>>   { return TOK_EOF; }


