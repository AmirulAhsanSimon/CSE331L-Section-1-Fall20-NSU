.MODEL SMALL
 .STACK 100H

 .DATA
   PROMPT_1  DB  "Enter a string : $"
   PROMPT_2  DB  0DH,0AH,"No. of Vowels = $"
   PROMPT_3  DB  0DH,0AH,"No. of Consonants = $"

   STRING        DB  50 DUP (?)   
   C_VOWELS      DB "AEIOU" 
   S_VOWELS      DB "aeiou" 
   C_CONSONANTS  DB "BCDFGHJKLMNPQRSTVWXYZ" 
   S_CONSONANTS  DB "bcdfghjklmnpqrstvwxyz" 

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX
     MOV ES, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     LEA DI, STRING               

     CALL READ_STR                

     XOR DX, DX                   
     LEA SI, STRING
                    
     OR BX, BX                    
     JE @EXIT                     

     @COUNT:                      
       LODSB                      

       LEA DI, C_VOWELS           
       MOV CX, 5                  

       REPNE SCASB                
       JE @INCREMENT_VOWELS       
                                  

       LEA DI, S_VOWELS           
       MOV CX, 5                  

       REPNE SCASB                
       JE @INCREMENT_VOWELS       
                                  ; small vowel

       LEA DI, C_CONSONANTS       ; set DI=offset address of variable
                                  ; C_CONSONANTS
       MOV CX, 21                 ; set CX=21

       REPNE SCASB                ; check AL is capital consonant or not
       JE @INCREMENT_CONSONANTS   ; jump to label @INCREMENT_CONSONANTS if AL
                                  ; is capital consonant

       LEA DI, S_CONSONANTS       ;  set DI=offset address of variable
                                  ; S_CONSONANTS
       MOV CX, 21                 ; set CX=21

       REPNE SCASB                ; check AL is small consonant or not
       JE @INCREMENT_CONSONANTS   ; jump to label @INCREMENT_CONSONANTS if AL
                                  ; is small consonants

       JMP @NEXT                  ; otherwise, jump to label @NEXT

       @INCREMENT_VOWELS:         ; jump label
         INC DL                   ; increment DL
         JMP @NEXT                ; jump to label @NEXT

       @INCREMENT_CONSONANTS:     ; jump label
         INC DH                   ; increment DH

       @NEXT:                     ; jump label
         DEC BX                   ; decrement BX
         JNE @COUNT               ; jump to label @COUNT while BX!=0

       @EXIT:                     ; jump label

     MOV CX, DX                   ; set CX=DX

     LEA DX, PROMPT_2             ; load and display the string PROMPT_2
     MOV AH, 9                     
     INT 21H                       

     XOR AX, AX                   ; clear AX
     MOV AL, CL                   ; set AL=CL

     CALL OUTDEC                  ; call the procedure OUTDEC

     LEA DX, PROMPT_3             ; load and display the string PROMPT_3
     MOV AH, 9
     INT 21H

     XOR AX, AX                   ; clear AX
     MOV AL, CH                   ; set AL=CH

     CALL OUTDEC                  ; call the procedure OUTDEC

     MOV AH, 4CH                  ; return control to DOS
     INT 21H
   MAIN ENDP

    READ_STR PROC
    ; this procedure will read a string from user and store it
    ; input : DI=offset address of the string variabel
    ; output : BX=number of characters read
    ;        : DI=offset address of the string variabel

    PUSH AX                       ; push AX onto the STACK
    PUSH DI                       ; push DI onto the STACK

    CLD                           ; clear direction flag
    XOR BX, BX                    ; clear BX

    @INPUT_LOOP:                  ; loop label
      MOV AH, 1                   ; set input function 
      INT 21H                     ; read a character

      CMP AL, 0DH                 ; compare AL with CR
      JE @END_INPUT               ; jump to label @END_INPUT if AL=CR

      CMP AL, 08H                 ; compare AL with 08H
      JNE @NOT_BACKSPACE          ; jump to label @NOT_BACKSPACE if AL!=08H

      CMP BX, 0                   ; compare BX with 0
      JE @INPUT_ERROR             ; jump to label @INPUT_ERROR if BX=0

      MOV AH, 2                   ; set output function
      MOV DL, 20H                 ; set DL=20H
      INT 21H                     ; print a character

      MOV DL, 08H                 ; set DL=08H
      INT 21H                     ; print a character

      DEC BX                      ; set BX=BX-1
      DEC DI                      ; set DI=DI-1
      JMP @INPUT_LOOP             ; jump to label @INPUT_LOOP

      @INPUT_ERROR:               ; jump label
      MOV AH, 2                   ; set output function
      MOV DL, 07H                 ; set DL=07H
      INT 21H                     ; print a character

      MOV DL, 20H                 ; set DL=20H
      INT 21H                     ; print a character
      JMP @INPUT_LOOP             ; jump to label @INPUT_LOOP      

      @NOT_BACKSPACE:             ; jump label
      STOSB                       ; set ES:[DI]=AL
      INC BX                      ; set BX=BX+1
      JMP @INPUT_LOOP             ; jump to label @INPUT_LOOP

    @END_INPUT:                   ; jump label

    POP DI                        ; pop a value from STACK into DI
    POP AX                        ; pop a value from STACK into AX

    RET
  READ_STR ENDP


 ;--------------------------------  OUTDEC  --------------------------------;


 OUTDEC PROC
   ; this procedure will display a decimal number
   ; input : AX
   ; output : none

   PUSH BX                        ; push BX onto the STACK
   PUSH CX                        ; push CX onto the STACK
   PUSH DX                        ; push DX onto the STACK

   CMP AX, 0                      ; compare AX with 0
   JGE @START                     ; jump to label @START if AX>=0

   PUSH AX                        ; push AX onto the STACK

   MOV AH, 2                      ; set output function
   MOV DL, "-"                    ; set DL=\'-\'
   INT 21H                        ; print the character

   POP AX                         ; pop a value from STACK into AX

   NEG AX                         ; take 2\'s complement of AX

   @START:                        ; jump label

   XOR CX, CX                     ; clear CX
   MOV BX, 10                     ; set BX=10

   @OUTPUT:                       ; loop label
     XOR DX, DX                   ; clear DX
     DIV BX                       ; divide AX by BX
     PUSH DX                      ; push DX onto the STACK
     INC CX                       ; increment CX
     OR AX, AX                    ; take OR of Ax with AX
   JNE @OUTPUT                    ; jump to label @OUTPUT if ZF=0

   MOV AH, 2                      ; set output function

   @DISPLAY:                      ; loop label
     POP DX                       ; pop a value from STACK to DX
     OR DL, 30H                   ; convert decimal to ascii code
     INT 21H                      ; print a character
   LOOP @DISPLAY                  ; jump to label @DISPLAY if CX!=0

   POP DX                         ; pop a value from STACK into DX
   POP CX                         ; pop a value from STACK into CX
   POP BX                         ; pop a value from STACK into BX

   RET                            ; return control to the calling procedure
 OUTDEC ENDP





 END MAIN
