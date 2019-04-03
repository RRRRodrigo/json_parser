%{
#include <stdio.h>
void yyerror(char *c);
int yylex(void);

%}

%token NUMERO NOME DOISPONTOS ASPAS ABRE FECHA VIRGULA CHAVE

%%

PROGRAMA:
        ABRE OBJETO FECHA { printf("VALIDO"); }
        ;

OBJETO:
	NOME DOISPONTOS NUMERO
	| NOME DOISPONTOS NOME
	| NOME DOISPONTOS OBJETO
	| NOME DOISPONTOS CHAVE
	
	| ABRE OBJETO FECHA

	| OBJETO VIRGULA OBJETO

	;

CHAVE:
	ABRE2 NOME VIRGULA NUMERO FECHA2
	| ABRE2 FECHA2
	;
	
NUMERO: 
	NUMERO
	| ASPAS NUMERO ASPAS
	;

NOME:
	ASPAS NOME ASPAS
	;

%%

void yyerror(char *s) {
    fprintf(stderr, "INVALIDO");
}

int main() {
  yyparse();
  return 0;

}
