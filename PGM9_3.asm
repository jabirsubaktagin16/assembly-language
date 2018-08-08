INDEC PROC
    ;reads a number in range -32768 to 32767
    ;input:none
    ;output:AX=binary equivalent of number
    PUSH BX
    PUSH CX
    PUSH DX
    ;print prompt
    BEGIN:
    MOV AH,2
    MOV DL,'?'
    INT 21H
    ;total=0
    XOR BX,BX
    ;negative=false
    XOR CX,CX
    ;read a character
    MOV AH,1
    INT 21H
    ;case character of
    CMP AL,'-'
    JE MINUS
    CMP AL,'+'
    JE PLUS
    JMP REPEAT2
    MINUS:
    MOV CX,1
    PLUS:
    INT 21H
    ;end_case
    REPEAT2:
    ;if character is between '0' and '9'
    CMP AL,'0'
    JNGE NOT_DIGIT
    CMP AL,'9'
    JNLE NOT_DIGIT
    ;then convert character to a digit
    AND  AX,000FH
    PUSH AX
    ;total=totalx10+digit
    MOV AX,10
    MUL BX
    POP BX
    ADD BX,AX
    ;read a character
    MOV AH,1 
    INT 21H
    CMP AL,0DH
    JNE REPEAT2
    ;until  CR
    MOV AX,BX
    ;if negative
    OR CX,CX
    JE EXIT
    ;then
    NEG AX
    ;end_if
    EXIT:
    POP DX
    POP CX
    POP BX
    RET
    ;here if illegal character entered
    NOT_DIGIT:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    JMP BEGIN
    INDEC ENDP