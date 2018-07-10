.MODEL SMALL
.STACK 100H
.DATA
    CR EQU ODH
    LF EQU 0AH
MSG1 DB 'ENTER 1ST NUMBER: $'
MSG2 DB 'ENTER 2ND NUMBER: $'
MSG DB 0AH,0DH,'THE SUM OF '
C1 DB ?,' AND '
C2 DB ?,' IS '
SUM DB ?,'$'

.CODE
MAIN PROC
    
    MOV AX,@DATA    		;get data segment
    MOV DS,AX       		;initialize DS
    
    LEA DX,MSG1     		;get first message
    MOV AH,9        		;display string function
    INT 21H         		;display first message
    
    MOV AH,1        		;read 1st character function
    INT 21H         		;read 1st number into AL
    MOV C1,AL       		;store in C1
    
    ;new line print
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H          
    
    LEA DX,MSG2    		 ;get second message
    MOV AH,9        		;display string function
    INT 21H         		;display second message
    
    MOV AH,1        		;read 2nd character function
    INT 21H        			;read 2nd number into AL
    MOV C2,AL       		;store in C2
    
    
    ADD AL,C1       		;add the two numbers
    SUB AL,30H      		;*
    MOV SUM,AL      		;store in SUM
    
    LEA DX,MSG      		;get final message
    MOV AH,9        		;diplay string function
    INT 21H         		;display final message with sum in front
    
    
    MOV AH,4CH
    INT 21H         		;DOS exit
    
    MAIN ENDP
END MAIN
