;program divides input number by number of times loop runs
dosseg
.model small
.stack 100h
.data
str db 10,13,'Enter the number of loop: $'
str2 db 10,13,'Enter your number: $'
str3 db 10,13,'Divided val is: $'
q db ?
r db ?
l db ?
d1 dw ?

.code
main proc
mov ax,@data
mov ds,ax

mov dx,offset str ;   Entering loop val prompt
mov ah,9
int 21h

mov ah,1 ;          entering loop val
int 21h
sub al,48
mov l,al ;         storing loop val

mov dx,offset str2 ;   entering divident val prompt
mov ah,9
int 21h

mov ah,1 ;      input divident
int 21h
sub al,48

mov d1,al ;  storing divident

mov cl,l  ;       intializing loop

l1:
mov ax,d1
div l

mov q,al ; initializing quotient
mov r,ah ; intializing remainder

mov dx,10
mov ah,2
int 21h

mov dx,13
mov ah,2
int 21h

mov dl,q
add dl,48
mov ah,2
int 21h

mov dl,r
add dl,48
mov ah,2
int 21h

dec l

loop l1

mov ah,4ch
int 21h

main endp
end main

