



org 100h ;#include <stdio.h>   starting add - 0000, ending - FFFF; prog start, assembler, return
         ; 02 --- 02H;
         
             ; int main(){
MOV AX, 02
MOV BX, 02

ADD AX, BX

            ; AX=AX+BX             ;  int a=2, b= 2, c=0;
            ;  c = a+b;
            ;  printf(c);
            ;  return 0;
            ;
ret




