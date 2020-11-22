
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

ARR DW 5 DUP(?)

MOV AX, OFFSET ARR
ADD [AX], 1
ADD [AX+1], 2
ADD [AX+2], 1
ADD [AX+3], 2
ADD [AX=4], 1 


 



ret




