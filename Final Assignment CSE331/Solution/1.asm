.MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1  DB  "Enter the Lower Case Letter : $"
    PROMPT_2  DB  "The Upper Case Letter is : $"

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H

     MOV AH, 1                    
     INT 21H

     MOV BL, AL                    
     
     MOV AH, 2                     
     MOV DL, 0DH
     INT 21H

     MOV DL, 0AH                  
     INT 21H

     LEA DX, PROMPT_2            
     MOV AH, 9
     INT 21H

     SUB BL, 20H                  

     MOV AH, 2                   
     MOV DL, BL
     INT 21H

     MOV AH, 4CH                 
     INT 21H
   MAIN ENDP 
 END MAIN


