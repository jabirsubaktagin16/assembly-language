PRINT_2D_ARRAY PROC


   PUSH AX                        
   PUSH CX                        
   PUSH DX                        
   PUSH SI                        
   
   MOV CX, BX                     

   @OUTER_LOOP:                   
     MOV CL, BL                   
     MOV AH, 2                    

     @PRINT_NAME:                 
       MOV DL, [SI]               
       INT 21H                    

       INC SI                     
       DEC CL                     

       CMP CL, 4                  
     JG @PRINT_NAME               

     MOV DL, 20H                  
     INT 21H                      
     
     @INNER_LOOP:                 
       MOV AH, 2                  
       MOV DL, 20H                
       INT 21H                    
                             
       XOR AH, AH
       MOV AL, [SI]               
                            
       CALL OUTDEC                

       INC SI                     
       DEC CL                     
     JNZ @INNER_LOOP              
                           
     MOV AH, 2                    
     MOV DL, 0DH                  
     INT 21H                      

     MOV DL, 0AH                  
     INT 21H                      

     DEC CH                       
   JNZ @OUTER_LOOP                

   POP SI                         
   POP DX                         
   POP CX                         
   POP AX                         

   RET
 PRINT_2D_ARRAY ENDP