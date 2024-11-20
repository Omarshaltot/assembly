org 100h
.data   
msg1 db 'enter first num $'
msg2 db 10,13, 'enter 2nd num $'  
msg3 db 10,13, '1 for avg ,2 sum ,3 product $' 
res db 10,13 , 'the result is : $'
chc db ? 
var1 db ?
var2 db ?
sum db ?
pro db ?
avg db ?

.code 

;input 1
mov ah,9
lea dx , msg1
int 21h 

mov ah ,1h
int 21h       
sub al,30h
mov var1,al 

;input 2

 

mov ah,9
lea dx , msg2
int 21h


mov ah ,1h
int 21h       
sub al,30h
mov var2,al  
choice:
;input 3
mov ah,9
lea dx , msg3
int 21h 

mov ah ,1h
int 21h       
sub al,30h
mov chc,al  

mov al,chc
cmp al,1
je  avg1
cmp al,2
je  sum1
cmp al,3
je  pro1
cmp al,0
je end



        
sum1:
mov al,var1
mov bl,var2
add al,bl
mov sum ,al 

mov ah,9
lea dx , res
int 21h

mov ah,2      
mov dl , sum  
add dl,30h
int 21h
 
jmp choice         
       
 

avg1:
mov ax,0h 

mov al,var1
mov bl,var2
add al,bl
mov sum ,al

mov al,sum 
mov bl,2h
div bl
mov avg,al

mov ah,9
lea dx , res
int 21h

mov ah,2
mov dl , avg
add dl,30h
int 21h
 
jmp choice         
       

pro1:
mov al,var1
mov bl,var2
mul bl
mov pro,al 

mov ah,9
lea dx , res
int 21h

mov ah,2
mov dl , pro
add dl , 30h
int 21h
 
jmp choice         
       


end: