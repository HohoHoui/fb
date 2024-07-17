/*Declarations for a calculator fb3-1.h*/

/*interface to the lexer*/
extern int yylineno;
void yyerror(char *s, ...);

/*nodes in the abstract syntax tree*/
struct ast{
	int nodetype;
	struct ast *l;
	struct ast *r;
};

struct numval{
	int nodetype;
	double number;
};

/*bild an AST*/
struct ast *newast(int nodetype, struct ast *l, struct ast *r);
struct ast *newnum(double d);

/*evaluate an AST*/
double eval(struct ast *);

void treefree(struct ast *);
