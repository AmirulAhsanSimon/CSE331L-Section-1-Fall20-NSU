.model small
.stack 100h
.data
msg1 db 10,13,"ENTER A HEX DIGIT: $"
msg2 db 10,13,"IN DECIMAL IS IT: $"
msg3 db 10,13,"DO YOU WANT TO DO IT AGAIN? $"
msg4 db 10,13,"INVALID CHARACTER- ENTER 0-9 OR A-F: $"


.code   


again:

   mov ax,@data
   mov ds,ax
   lea dx,msg1
   mov ah,9
   int 21h
   
   mov ah,1
   int 21h
   
   mov bl,al 
   
   
   jmp go
   
    
   
  
   
go:   
     
  

   cmp bl,'9'
   ja hex
   jb num
   je num
   
       
       
       
       
 hex:

    cmp bl,'F'
    ja illegal  
    
    
   lea dx,msg2 
   mov ah,9
   int 21h
   
    mov dl,49d
    mov ah,2
    int 21h
    
    sub bl,17d
    mov dl,bl
    mov ah,2
    int 21h
    
    jmp inp
    
     
    
    
 inp:
    
    lea dx,msg3
    mov ah,9
    int 21h
    
    mov ah,1
    int 21h
    
    mov cl,al
    cmp cl,'y'
    je again
    cmp cl,'Y'
    je again
    jmp exit
    
   
 num:
   
   cmp bl,'0'
   jb illegal
   
   lea dx,msg2 
   mov ah,9
   int 21h 
   
    
   mov dl,bl
   mov ah,2
   int 21h
   
   jmp inp
   
   
   
   
 illegal:
   
       lea dx,msg4
       mov ah,9
       int 21h
       
       mov ah,1
       int 21h
       
       mov bl,al 
       
       jmp go
       
   

exit:



