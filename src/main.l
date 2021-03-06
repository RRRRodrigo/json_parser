
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
          return NOM;
        }

["]     {
          return ASPAS;
        }

[0-9]+.[0-9]+ {
          return NUMER;
        }

[0-9]+  {
          return NUMER;
        }

[:]     {
          return DOISPONTOS;
        }

[;,]     {
          return VIRGULA;
        }

[ \t\n]+ ;

.     {yyerror("INVALIDO\n");}

%%

int yywrap() {
  return 1;
}
