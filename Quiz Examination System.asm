.model small  
.stack 100h    
.data          
 
            
quiz db ' WELLCOME TO Quiz',0ah,0dh,
db '$'      
      
      
                                      ;
correctStr db "  Answer is Correct$"  ;
WrongStr db "  Answer is Incorrect$"  ;
correctAns db ?                       ;
wrongAns db '0'                       ;
correctVar db 0                       ;
count db 1                            ;
count1 db 1
scoreStr db " Your Score: $"
tryAgainStr db '                         ',0ah,0dh
            db 'Do you want to try again?',0ah,0dh
            db 'Press Y to continue, any other key to exit: '
            db '$'

rules db ' RULES: ',0ah,0dh
      db ' * you have to select one option out of 4. ',0ah,0dh,
      db ' * you will get the points on every correct attempt',0ah,0dh,
      db ' * every questions will be of equal marks. ',0ah,0dh,
      db '$'
startQuiz db '                          ', 0ah, 0dh,
          db 'Press any key to start Quiz ', 0ah, 0dh,
          db '$'
      
q1 db 'Q1: what is the size of EAX register?',0ah, 0dh
      db '  1) 16 bit',0ah, 0dh,
      db '  2) 32 bit',0ah, 0dh,    ; 2. correct
      db '  3) 8 bit',0ah, 0dh,
      db '  4) 64 bit',0ah, 0dh,
      db '$'

q2 db 'Q2:  which is the looping register?',0ah, 0dh
      db '  1. CX',0ah, 0dh, ; 1. correct
      db '  2. AX',0ah, 0dh,    
      db '  3. BX',0ah, 0dh,
      db '  4. Controller',0ah, 0dh,
      db '$'

q3 db 'Q3:  which segment is used to define variables? ',0ah, 0dh
      db '  1. .code',0ah, 0dh,
      db '  2. .stack',0ah, 0dh,    
      db '  3. .data',0ah, 0dh, ;   3. correct
      db '  4. .model',0ah, 0dh,
      db '$'
      
q4 db 'Q4:  which keyword is used to define constant?',0ah, 0dh
      db '  1. Const',0ah, 0dh,
      db '  2. EQU',0ah, 0dh,    ; 2. correct
      db '  3. ex',0ah, 0dh,
      db '  4. define',0ah, 0dh,
      db '$'
      
q5 db 'Q5: which operation is incorrect?',0ah, 0dh
      db '  1. memory to register',0ah, 0dh,
      db '  2. constant to memory',0ah, 0dh,    
      db '  3. segment to segment',0ah, 0dh,     ; 3. correct
      db '  4. register to register',0ah, 0dh,
      db '$'

q6 db 'Q6: which operation is used to invoke a procedure?',0ah, 0dh
      db '  1. invoke proc_name',0ah, 0dh,
      db '  2. call proc_name',0ah, 0dh,    ; 2. correct
      db '  3. here proc_name',0ah, 0dh,
      db '  4. procedure proc_name',0ah, 0dh,
      db '$'
      
q7 db 'Q7:  which is equivalent operator of Jae?',0ah, 0dh
      db '  1. jb',0ah, 0dh,
      db '  2. jge',0ah, 0dh,    
      db '  3. jnb',0ah, 0dh,  ; 3. correct
      db '  4. jz',0ah, 0dh,
      db '$'
      
q8 db 'Q8: which interrupt is used to set pointer on screen?',0ah, 0dh
      db '  1. int 10h',0ah, 0dh,    ; 1. correct
      db '  2. int 20h',0ah, 0dh,    
      db '  3. int 21h',0ah, 0dh,
      db '  4. 17h',0ah, 0dh,
      db '$'
      
q9 db 'Q9:  stack is....?',0ah, 0dh
      db '  1. linear with one end ',0ah, 0dh,      ; 1. correct
      db '  2. linear with two ends',0ah, 0dh,    
      db '  3. non-linear with one end',0ah, 0dh,
      db '  4. non-linear with two ends',0ah, 0dh,
      db '$'
q10 db 'Q10:  which is execution effcient? ',0ah, 0dh
      db '  1. procedure',0ah, 0dh,
      db '  2. macro',0ah, 0dh,       ; 2.correct
      db '  3. both',0ah, 0dh,
      db '  4. non of them',0ah, 0dh,
      db '$'

.code               
    main proc     
    
    mov ax, @data   
    mov ds, ax        
    
    
    ;-------- Q1 --------------------
    jmp firstAttempt  
    start:
    call clearSc
    
    firstAttempt: 
    
    mov correctAns, '0'
      mov ah,09        
    lea dx, quiz      
    int 21h            
    
    mov ah,09
    lea dx, rules
    int 21h
    
    mov ah, 09
    lea dx, startQuiz
    int 21h
    
    mov ah, 01  
    int 21h
    
    call clearSc   
    mov ah, 09
    lea dx, q1      
    int 21h
    
    mov ah, 01     
    int 21h
    
    
    cmp al, '2'     
    je corrAns1
    jmp wrongAns1   
    
    
    
    corrAns1:
     call correctAnsProc  
     jmp q2x               
     
    wrongAns1:
     call wrongAnsProc
     jmp q2x
     
    
    
    ;--------- Q2 -------------------
     
    q2x:
    call clearSc 
    mov ah, 09
    lea dx, q2
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '1'
    je corrAns2
    jmp wrongAns2
    
    
    
    corrAns2:
     call correctAnsProc
     jmp q3x 
     
    wrongAns2:
     call wrongAnsProc 
     jmp q3x
    
    ;--------- Q3----------------
    
    q3x: 
    call clearSc
    mov ah, 09
    lea dx, q3
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '3'
    je corrAns3
    jmp wrongAns3
    
    
    
    corrAns3:
     call correctAnsProc
     jmp q4x 
     
    wrongAns3:
     call wrongAnsProc
     jmp q4x
    
    ;--------- Q4----------------
    
    q4x: 
    call clearSc
    mov ah, 09
    lea dx, q4
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '2'
    je corrAns4
    jmp wrongAns4
    
    
    
    corrAns4:
     call correctAnsProc
     jmp q5x 
     
    wrongAns4:
     call wrongAnsProc 
     jmp q5x
    
    ;--------- Q5----------------
    
    q5x: 
    call clearSc
    mov ah, 09
    lea dx, q5
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '3'
    je corrAns5
    jmp wrongAns5
    
    
    
    corrAns5:
     call correctAnsProc
     jmp q6x 
     
    wrongAns5:
     call wrongAnsProc 
     jmp q6x
    
    ;--------- Q6----------------
    
    q6x: 
    call clearSc
    mov ah, 09
    lea dx, q6
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '2'
    je corrAns6
    jmp wrongAns6
    
    
    
    corrAns6:
     call correctAnsProc
     jmp q7x 
     
    wrongAns6:
     call wrongAnsProc  
     jmp q7x
    
    ;--------- Q7 ----------------
    
    q7x: 
    call clearSc
    mov ah, 09
    lea dx, q7
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '3'
    je corrAns7
    jmp wrongAns7
    
    
    
    corrAns7:
     call correctAnsProc
     jmp q8x 
     
    wrongAns7:
     call wrongAnsProc
     jmp q8x
    
    ;--------- Q8----------------
    
    q8x: 
    call clearSc
    mov ah, 09
    lea dx, q8
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '1'
    je corrAns8
    jmp wrongAns8
    
    
    
    corrAns8:
     call correctAnsProc
     jmp q9x 
     
    wrongAns8:
     call wrongAnsProc
     jmp q9x
    
    ;--------- Q9----------------
    
    
    
    q9x: 
    call clearSc
    mov ah, 09
    lea dx, q9
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '1'
    je corrAns9
    jmp wrongAns9
    
    
    
    corrAns9:
     call correctAnsProc
     jmp q10x 
     
    wrongAns9:
     call wrongAnsProc  
     jmp q10x
     
    ;--------- Q10----------------
    
    q10x: 
    call clearSc
    mov ah, 09
    lea dx, q10
    int 21h
    
    mov ah, 01
    int 21h
    
    
    cmp al, '2'
    je corrAns10
    jmp wrongAns10
    
    
    
    corrAns10:
     call correctAnsProc
     jmp q11x 
     
    wrongAns10:
     call wrongAnsProc  
     jmp q11x
    
    ;--------- QUIZ OVER----------------
    
    
    Q11x:
    call clearSc
   
    
    mov ah, 09
    lea dx, scoreStr    
    int 21h
   
    mov ah, 02
    mov dl, correctAns     
    int 21h
    
   again:   
    mov ah, 09            
    lea dx, tryAgainStr
    int 21h
    
    
    
    mov ah, 01        
    int 21h
    cmp al, 'Y'        
    je start          
    cmp al, 'y'
    je start
       
    exit:                      
mov ah, 4ch        
int 21h
main endp         

        
;-------- CLEAR SCREEN PROC -----;
    
clearSc proc
    
    mov ah, 02    
    mov dl, 0   
    mov dh, 0
    mov bx, 0
    int 10h     

    mov ah, 0fh    
    int 10h
    mov ah, 0       
    int 10h


    mov ah, 02      
    mov dl, 0
    mov dh, 0
    mov bx, 0
    int 10h
    
ret         
clearSc endp       


;-------- CorrectAns PROC -----;
correctAnsProc proc
    mov ah, 09     
    lea dx, correctStr
    int 21h
    inc correctAns
   ret
correctAnsProc endp


;-------- WrongAns PROC -----;
wrongAnsProc proc
    mov ah, 09
    lea dx, wrongStr
    int 21h  
     inc wrongAns
   ret
wrongAnsProc endp    
    
end main                      

;-------------------------------
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             
             