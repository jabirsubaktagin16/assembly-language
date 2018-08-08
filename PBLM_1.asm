 .MODEL SMALL
 .STACK 100H

 .DATA
    PROMPT_1   DB  'The Class Marks are as follows : ',0DH,0AH,'$'
    PROMPT_2   DB  0DH,0AH,'The Average Marks of Students are as follows : ',0DH,0AH,'$'

    AVERAGE  DW  4 DUP(0)
     CLASS   DB  'Mary Allen  ',67,45,98,33
             DB  'Scott Baylis',70,56,87,44
             DB  'George Frank',82,72,89,40
             DB  'Sam Wong    ',78,76,92,60 

 .CODE
   MAIN PROC
     MOV AX, @DATA                
     MOV DS, AX

     LEA DX, PROMPT_1             
     MOV AH, 9
     INT 21H
 
     LEA SI, CLASS                
     MOV BH, 4                    
     MOV BL, 16                   

     CALL PRINT_2D_ARRAY          

     LEA DI, AVERAGE             
     LEA SI, CLASS                
     ADD SI, 12                 
     MOV CX, 4                  

     @COMPUTE_AVERAGE:          
        XOR AX, AX                 
        MOV DX, 4                  

     @SUM:                      
        XOR BH, BH               
        MOV BL, [SI]         

     ADD AX, BX           

     INC SI               
     DEC DX               
     JNZ @SUM               

     MOV BX, 4              
     DIV BX                 

     MOV [DI], AX           
     ADD DI, 2              
     ADD SI, 12             
     LOOP @COMPUTE_AVERAGE    

     LEA DX, PROMPT_2         
     MOV AH, 9                     
     INT 21H

     LEA SI, AVERAGE          
     LEA DI, CLASS            
     MOV CX, 4                

     @PRINT_RESULT:           
        MOV BX, 12             
        MOV AH, 2              

     @NAME:                 
        MOV DL, [DI]         
        INT 21H              

     INC DI               
     DEC BX               
     JNZ @NAME              

     MOV DL, 20H            
     INT 21H                

     MOV DL, ":"            
     INT 21H                

     MOV DL, 20H            
     INT 21H                

     XOR AH, AH             
     MOV AL, [SI]           

     CALL OUTDEC            

     MOV AH, 2              
     MOV DL, 0DH            
     INT 21H                    

     MOV DL, 0AH            
     INT 21H

     ADD SI, 2              
     ADD DI, 4              
     LOOP @PRINT_RESULT       

     MOV AH, 4CH              
     INT 21H
     INCLUDE PRINT_2D_ARRAY.ASM
     INCLUDE PGM9_1.ASM
   
   END MAIN