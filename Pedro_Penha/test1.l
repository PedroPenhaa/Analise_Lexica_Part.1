identificador [a-zA-Z]([a-zA-Z0-9])*
numero[0-9]+
espaco[ \t]+
novalinha[\n]

%x comentario

%{
#include "y.tab.h"
#include <stdlib.h>
void yyerror (char *);
%}

%%

programa {
    printf("%11s:palavra_reservada:T_PROGRAMA\n", yytext); 
    return T_PROGRAMA;
    }

e { 
    printf("%11s:palavra_reservada:T_E\n", yytext); 
    return T_E;
    }

inicio { 
    printf("%11s:palavra_reservada:T_INICIO\n", yytext); 
    return T_INICIO;
    }

fimprograma { 
    printf("%11s:palavra_reservada:T_FIM\n", yytext); 
    return T_FIM;
    }

leia { 
    printf("%11s:palavra_reservada:T_LEIA\n", yytext); 
    return T_LEIA;
    }
    
escreva {
    printf("%11s:palavra_reservada:T_ESCREVA\n", yytext);
    return T_ESCREVA;
    }

se {
    printf("%11s:palavra_reservada:T_SE\n", yytext);
    return T_SE;
    }

entao {
    printf("%11s:palavra_reservada:T_ENTAO\n", yytext);
    return T_ENTAO;
    }

senao {
    printf("%11s:palavra_reservada:T_SENAO\n", yytext);
    return T_SENAO;
    }
fimse {
    printf("%11s:palavra_reservada:T_FIMSE\n", yytext);
    return T_FIMSE;
    }

enquanto {
    printf("%11s:palavra_reservada:T_ENQTO\n", yytext); 
    return T_ENQTO;
    }

faca {
    printf("%11s:palavra_reservada:T_FACA\n", yytext);
    return T_FACA;
    }

fimenquanto {
    printf("%11s:palavra_reservada:T_FIMENQTO\n", yytext);
    return T_FIMENQTO;
    }

"+" {
    printf("%11s:operador_aritimético:T_MAIS\n", yytext);
    return T_MAIS;
    }

"-" {
    printf("%11s:operador_aritimético:T_MENOS\n", yytext);
    return T_MENOS;
    }

"*" {
    printf("%11s:operador_aritimético:T_VEZES\n", yytext);
    return T_VEZES;
    }

"/" {
    printf("%11s:operador_aritimético:T_DIV\n", yytext);
    return T_DIV;
    }

">" {
    printf("%11s:operador_aritimético:T_MAIOR\n", yytext);
    return T_MAIOR;
    }

"<" {
    printf("%11s:operador_aritimético:T_MENOR\n", yytext);
    return T_MENOR;
    }

"=" {
    printf("%11s:operador_aritimético:T_IGUAL\n", yytext);
    return T_IGUAL;
    }

ou {printf("%11s:palavra_reservada:T_OU\n", yytext);return T_OU;}
nao {printf("%11s:palavra_reservada:T_NAO\n", yytext);return T_NAO;}
"<-" {printf("%11s:operador_de_atribuição: T_ATRIB\n", yytext);return T_ATRIB;}
"(" {printf("%11s:abre_parentese: T_ABRE\n", yytext);return T_ABRE;}
")" {printf("%11s:fecha_parentese: T_FECHA\n", yytext);return T_FECHA;}

inteiro {
    printf("%11s:palavra_reservada:T_INTEIRO\n", yytext);
    return T_INTEIRO;
    }

logico {
    printf("%11s:palavra_reservada:T_LOGICO\n", yytext);
    return T_LOGICO;
    }

V {
    printf("%11s:palavra_reservada:T_V\n", yytext);
    return T_V;
    }

F {
    printf("%11s:palavra_reservada:T_F\n", yytext);
    return T_F;
    }

{identificador} {printf("%11s:palavra_reservada:T_IDENTIF\n", yytext); return T_IDENTIF;}
{numero} {printf("%11s:palavra_reservada:T_NUMERO\n", yytext);return T_NUMERO;}

{espaco} /*não faz nada*/
{novalinha} /*não faz nada*/
"//".* /* comentario de linha */
"/*" BEGIN(comentario);
<comentario>"*/" BEGIN(INITIAL);
<comentario>. /* nao faz nada */
. printf ("ERRO LEXICO");

%%

int yywrap(void){
return 1;
}