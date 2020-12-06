 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  "Digits: $"
    PROMPT_2  DB  0DH,0AH, "Sum: $"

 .CODE
   MAIN PROC
     MOV AX, @DATA                 
     MOV DS, AX

     LEA DX, PROMPT_1                
     MOV AH, 9
     INT 21H

     MOV CX, 10                  

     MOV AH, 2                      
     MOV DL, 48                   

     @LOOP:                       
       INT 21H                    

       INC DL                     
       DEC CX                     
     JNZ @LOOP
     
     LEA DX, PROMPT_2                
     MOV AH, 9
     INT 21H                    

     MOV AH, 4CH                 
     INT 21H
   MAIN ENDP
 END MAIN



