DATA SEGMENT
        STR1 DB "Enter your string: $"
        STR2 DB "Your entered string is: $"
        STR3 DB "Reverse ofyour string is: $"
        INSTR1 DB 20 DUP("$")
        RSTR DB 20 DUP("$")
        NEWLINE DB 10,13,"$"
        N DB ?
        S DB ?
        MSG1 DB "$"
        MSG2 DB "STRING IS NOT PALINDROME$"
        A DB "1"

DATA ENDS

CODE SEGMENT
        ASSUME DS:DATA,CS:CODE
START:

        MOV AX,DATA
        MOV DS,AX

        LEA SI,INSTR1

        MOV AH,09H
        LEA DX,STR1
        INT 21H

        MOV AH,0AH
        MOV DX,SI
        INT 21H


        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H



        MOV AH,09H
        LEA DX,STR2
        INT 21H

        MOV AH,09H
        LEA DX,INSTR1+2
        INT 21H

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H



        MOV AH,09H
        LEA DX,STR3
        INT 21H

        MOV CL,INSTR1+1
        ADD CL,1
        ADD SI,2

     L1:
        INC SI

        CMP BYTE PTR[SI],"$"
        JNE L1

        DEC SI

        LEA DI,RSTR

     L2:MOV AL,BYTE PTR[SI]

        MOV BYTE PTR[DI],AL

        DEC SI
        INC DI
        LOOP L2

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

        MOV AH,09H
        LEA DX,RSTR
        INT 21H


        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H



        LEA SI,INSTR1
        LEA DI,RSTR

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

        ADD SI,2

     L7:
        MOV BL,BYTE PTR[DI]


        CMP BYTE PTR[SI],BL
        JNE LL2


        INC SI
        INC DI

        MOV BL,BYTE PTR[DI]

        MOV AH,02H
        MOV DL,BL
        INT 21H

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H



        CMP BYTE PTR[DI],"$"
        JNE L7

        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

        MOV AH,09H
        LEA DX,MSG1
        INT 21H

        JMP L5
      
      LL2:
        MOV AH,09H
        LEA DX,NEWLINE
        INT 21H

        MOV AH,09H
        LEA DX,MSG2
        INT 21H

     L5:

        MOV AH,4CH
        INT 21H


CODE ENDS
END START