/*event more like Unix wc*/

%option noyywrap
%{
    int chars = 0;
    int words = 0;
    lines = 0;
%}

%%

[a-zA-Z]+	{words++; chars += strlen(yytext);}
\n	{chars++; lines++;}
.	{chars++;}

%%

main(argc, argv)
int argc;
char **argv;
{
	if(argc > 1){
		for(int i = 1 ; i < argc ; i++){
			if(!(yyin = fopen(argv[i], "r"))){
				perror(argv[i]);
				return (1);
			}
		}
	}

	yylex();
	printf("%8d%8d%8d\n", lines, words, chars);
}