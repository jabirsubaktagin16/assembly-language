.MODEL SMALL
.STACK 100H
.DATA  
STR1 DB 'ENTER A CAPITAL LETTER:$' 
STR2 DB 0AH,0DH,'ENTER ANOTHER CAPITAL LETTER:$' 
SPACE DB ' $'
A DB ?
B DB ?
.CODE
MAIN PROC
    MOV AX,@DATA 
    MOV DS,AX 
    
    ;OUTPUT STR1
    LEA DX,STR1
    MOV AH,9
    INT 21H
    
    ;INPUT 1
    MOV AH,1
    INT 21H
    MOV A,AL    
    
    ;OUTPUT STR2
    LEA DX,STR2
    MOV AH,9
    INT 21H
    
    ;INPUT 2
    MOV AH,1
    INT 21H
    MOV B,AL  
    
    MOV AL,A
    CMP AL,B
    JL BLOCKA
    JG BLOCKB
    
    BLOCKA:
    MOV AH,2 
    MOV DL,0AH
    INT 21H 
    MOV AH,2 
    MOV DL,0DH
    INT 21H
    MOV AH,2 
    MOV DL,A
    INT 21H 
    LEA DX,SPACE
    MOV AH,9
    INT 21H
    MOV AH,2 
    MOV DL,B
    INT 21H
    JMP LAST
    
    BLOCKB:
    MOV AH,2 
    MOV DL,0AH
    INT 21H 
    MOV AH,2 
    MOV DL,0DH
    INT 21H
    MOV AH,2 
    MOV DL,B
    INT 21H 
    LEA DX,SPACE
    MOV AH,9
    INT 21H
    MOV AH,2 
    MOV DL,A
    INT 21H
    JMP LAST
    
    LAST:
    MOV AH,4CH
    INT 21H
    END MAIN