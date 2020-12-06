 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT  DB  "Digits: $"

 .CODE
   MAIN PROC
     MOV AX, @DATA                ; initialize DS 
     MOV DS, AX

     LEA DX, PROMPT               ; load and print PROMPT 
     MOV AH, 9
     INT 21H

     MOV CX, 10                   ; initialize CX

     MOV AH, 2                    ; set output function  
     MOV DL, 48                   ; set DL with 0

     @LOOP:                       ; loop label
       INT 21H                    ; print character

       INC DL                     ; increment DL to next ASCII character
       DEC CX                     ; decrement CX
     JNZ @LOOP                    ; jump to label @LOOP if CX is 0

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP
 END MAIN