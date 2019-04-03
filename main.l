%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%
"[" {
          return ABRE2;
        }

"]" {
          return FECHA2;
        }

"{" {
          return ABRE;
        }

"}" {
          return FECHA;
        }

[a-zA-Z][a-zA-Z0-9 ]* {
          return NOME;
        }

["]     {
          return ASPAS;
        }

[0-9]+.[0-9]+ {
          return NUMERO;
        }

[0-9]+  {
          return NUMERO;
        }

[:]     {
          return DOISPONTOS;
        }

[,]     {
          return VIRGULA;
        }

[ \t\n]+ ;

.     {yyerror("INVALIDO");}

%%

int yywrap() {
  return 1;
}
