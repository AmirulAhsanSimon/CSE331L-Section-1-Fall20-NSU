  .data

Fibonacci BYTE 1, 1, 10 DUP (?)

.code
main PROC

  L1:

  mov   esi, OFFSET Fibonacci       ; offset the variables
  mov   ebx,1               ; byte format
  mov   ecx, SIZEOF Fibonacci       ; counter
  call  dumpMem             ; display the data in the memory


    exit                    ;exits to Operating System
    main ENDP

END main
