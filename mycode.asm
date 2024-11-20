org 100h
.model small 

.data 
msg1 db 'enter base :$'
msg2 db 10,13,'enter exponent: $'
msg3 db 10,13,'the result is $'    
bas db ?
exp db ?
result db ?

.code
lea dx ,msg1
mov ah,9
int 21h  

mov ah ,1h
int 21h
sub al,30h
mov bas,al

lea dx,msg2
mov ah,9   
int 21h 

mov ah ,1h 
int 21h
sub al,30h
mov exp,al


mov cl,exp
mov al,1

     
loop1:  
cmp cl,0
je end
mul bas
loop loop1
mov result,al 
mov ah,9
lea dx,msg3
int 21h 
               
               
mov ah,2h
mov dl , result
add dl,30h
int 21h   



end:


 




