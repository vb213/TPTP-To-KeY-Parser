%{
    #include "tptp.tab.h"
    #include <stdio.h>
%}
%%

%.*\n                   { /*printf("NEWLINE ");*/ }
(include).*\n           { /*printf("INCLUDE ");*/ }
"axiom"                 { return axiom;}
"conjecture"            { return conjecture;}
"empty_set"             { /*printf("empty_set ");*/ return empty_set; }
"null_class"            { return empty_set;}
"universal_class"       { return universal_class;}
"empty"                 { /*printf("empty ");*/ return empty; }
"not_equal"             { /*printf("not_equal ");*/ return not_equal; }
"equal_set"             { /*printf("equal_set ");*/ return equal_set; }
"set_equal"             { /*printf("equal_set ");*/ return equal_set; }
[a-zA-Z_0-9]+(_symmetric_difference)([a-zA-Z_0-9]*)  { /*printf("identifier ");*/ return identifier; }
(symmetric_difference_)([a-zA-Z_0-9]+)  { /*printf("identifier ");*/ return identifier; }
"symmetric_difference"  {return symmetric_difference;}
[a-zA-Z_0-9]+(_unordered_pair)([a-zA-Z_0-9]*)  { /*printf("identifier ");*/ return identifier; }
(unordered_pair_)([a-zA-Z_0-9]+)  { /*printf("identifier ");*/ return identifier; }
"unordered_pair"        { return unordered_pair;}
([a-zA-Z]*_)([a-zA-Z_0-9]*)  { /*printf("identifier ");*/ return identifier; }
"subset"                { /*printf("subset ");*/ return subset; }
"subclass"              { return subset;}
"disjoint"              { /*printf("disjoint ");*/ return disjoint; }
"singleton"             { return singleton;}
"intersect"             { /*printf("intersect ");*/ return intersect; }
"complement"            { return complement;}
"equal"                 { /*printf("equal ");*/ return equal; }
"member"                { /*printf("member ");*/ return member; }
"element"               { /*printf("member ");*/ return member;}
"intersection"          { /*printf("intersection ");*/ return intersection; }
"union"                 { /*printf("union ");*/ return un; }
"difference"            { /*printf("difference ");*/ return difference; }
[a-zA-Z][a-zA-Z_0-9]*   { /*printf("identifier ");*/ yylval.str = strdup(yytext); return identifier; }
"&"                     { /*printf("connective ");*/ yylval.str = strdup(yytext); return and; }
"|"                     { /*printf("connective ");*/ yylval.str = strdup(yytext); return or; }
"<=>"                   { /*printf("connective ");*/ yylval.str = strdup(yytext); return equiv; }
"=>"                    { /*printf("connective ");*/ yylval.str = strdup(yytext); return impl; }
"~"                     { /*printf("not ");*/ return not; }
"!="                    { /*printf("infix_bin ");*/ return uneq_infix; }
"!"                     { /*printf("'!' ");*/ return '!'; }
"?"                     { /*printf("'?' ");*/ return '?'; }
"("                     { /*printf("'(' ");*/ return '('; }
")"                     { /*printf("')' ");*/ return ')'; }
"["                     { /*printf("'[' ");*/ return '['; }
"]"                     { /*printf("']' ");*/ return ']'; }
","                     { /*printf("',' ");*/ return ','; }
":"                     { /*printf("':' ");*/ return ':'; }
"="                     { /*printf("infix_bin ");*/ return eq_infix; }
"."                     { /*printf("'.' ");*/ return '.'; }
[ \t\f\v\n]             { /* Do nothing */ }

%%

int yywrap(void) {
    return -1;
}


