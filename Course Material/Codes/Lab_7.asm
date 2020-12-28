
.MODEL SMALL
.STACK 64
.DATA


  STRING DB ?
  
  SYM DB '$'
  
  INPUT_M DB 0ah,0dh,0AH,0DH, 'ENTER THE INPUT STRING/INTEGER: ',0DH,0AH,'$'
  
  OUTPUT_M DB 0ah,0dh,0AH,0DH, 'THE OUTPUT IS: ',0DH,0AH,'$'
  
  
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX
    
    MOV DX, OFFSET INPUT_M
    MOV AH, 9
    INT 21H
    
    LEA SI, STRING 
    
INPUT: MOV AH, 1
       INT 21H
       
       MOV [SI], AL
       INC SI
       
       CMP AL, 0DH
       JNZ INPUT
       
       MOV AL, SYM
       MOV [SI],'$'
       
OUTPUT: LEA DX, OUTPUT_M
        MOV AH, 9
        INT 21H
        
        MOV DL, 0AH
        MOV AH, 02H
        INT 21H
        
        
        MOV DX, OFFSET STRING
        MOV AH, 9
        INT 21H
        
        
        MOV AH, 4CH
        INT 21H
        
MAIN ENDP
END MAIN
  