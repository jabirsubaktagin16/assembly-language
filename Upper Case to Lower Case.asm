.MODEL SMALL
   .STACK 100H
   .DATA
        CR EQU 0DH
        LF EQU 0AH
   MSG1 DB 'ENTER A UPPER CASE LETTER: $'
   MSG2 DB 0DH, 0AH,'IN LOWER CASE IT IS: '
   CHAR DB ?,'$'
   
   .CODE
   MAIN PROC
    MOV AX,@DATA    		;get data segment
    MOV DS, AX       		;initialize DS
    
    LEA DX, MSG1     		;get first message
    MOV AH, 9        		;display string function
    INT 21H         		;display first message
    
    MOV AH, 1        		;read character function
    INT 21H         		;read a capital letter into AL
    ADD AL, 20H      		;convert it to lower case
    MOV CHAR, AL     		;store it
    LEA DX, MSG2     		;get second message
    MOV AH,9        		;display string function
    INT 21H         		;display second message and lower case letter in front
    
    MOV AH,4CH      
    INT 21H         		;DOS exit
    
    MAIN ENDP
   END MAIN
