%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%

[a-zA-Z]+	{words++; chars += strlen(yytext);}
\n		{lines++;}
.		{chars++;}

%%

main(int argc, char **argv)
{
	yylex();
	printf("%4d%4d%4d\n", lines, words, chars);	
}
