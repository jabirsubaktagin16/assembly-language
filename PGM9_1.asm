OUTDEC PROC
    ;prints AX as a signed decimal integer
    ;input: AX 
    ;output: none
    PUSH AX
    PUSH BX
    PUSH CX
    PUSH DX
    ;if AX<0
    OR AX,AX
    JGE END_IF1
    ;then
    PUSH AX
    MOV DL,'-'
    MOV AH,2
    INT 21H
    POP AX
    NEG AX
    END_IF1:
    ;get decimal digits
    XOR CX,CX
    MOV BX,10D
    REPEAT1:
    XOR DX,DX
    DIV BX 
    PUSH DX
    INC CX
    ;until
    OR AX,AX
    JNE REPEAT1
    ;convert digits to characters and print
    MOV AH,2
    ;for count times do
    PRINT_LOOP: 
    POP DX
    OR DL,30H 
    INT 21H
    LOOP PRINT_LOOP
    ;end_for
    POP DX 
    POP CX
    POP BX
    POP AX
    RET
    OUTDEC ENDP 
