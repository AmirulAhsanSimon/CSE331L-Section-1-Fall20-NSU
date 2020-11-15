

org 100h

                   ; int main(){
MOV AX, 02         ; int a=2, b=2, c=2, d=0;
MOV BX, 02
MOV CX, 02
ADD AX, BX, CX     ; d=a+b+c;
                   ; printf(d)
                   ; return 0;
                   ; } 

ret




