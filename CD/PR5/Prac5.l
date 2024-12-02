%{
#include "y.tab.h"
#include <string.h>
%}
%%
[a-zA-Z][a-zA-Z0-9]* { strcpy(yylval.vname, yytext); return NAME; }
[ \t]                { /* Ignore whitespace */ }
.                    { return yytext[0]; }
%%
int yywrap() { return 1; }

