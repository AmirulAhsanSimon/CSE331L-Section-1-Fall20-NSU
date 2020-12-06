
.MODEL SMALL
.STACK 100H


.DATA

PROMPT_1 DB "ENTER THE UPPER-CASE LETTER: $"
PROMPT_2 DB 0DH,0AH, "The lower case letter is:$" 


.CODE

MAIN PROC
    MOV AX,@DATA
    MOV DS, AX
    
    
    LEA DX, PROMPT_1
    MOV AH, 9
    INT 21H 
    
    MOV AH, 1
    INT 21H
    
    MOV BL, AL 
    
    LEA DX, PROMPT_2
    MOV AH, 9
    INT 21H
    
    OR BL, 20H
    
    MOV AH, 2
    MOV DL, BL
    INT 21H
    
    MOV AH, 4CH
    INT 21H
    
MAIN ENDP
END MAIN
    
    