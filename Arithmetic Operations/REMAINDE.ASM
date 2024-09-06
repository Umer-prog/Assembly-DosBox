;Program that tells if remainder of division is zero or not
dosseg
.model small
.stack 100h
.data
msg1 db 10,13,'Enter divident and divisor$'
msg2 db 10,13,'Enter your number: $'
val1 dw ?
val2 db ?
str1 db 10,13,'remainder is zero$'
str2 db 10,13,'remainder is not zero$'
q db ?
r db ?
a db 0
.code
main proc
mov ax,@data
mov ds,ax

;first message
mov dx,offset msg1
mov ah,9
int 21h

;Second message
mov dx,offset msg2
mov ah,9
int 21h

;first val input
mov ah,1
int 21h
sub al,48

;first val initialize
mov val1,al

;second message
mov dx,offset msg2
mov ah,9
int 21h

;second val input
mov ah,1
int 21h
sub al,48

;second val initialize
mov val2,al

;division
mov ax,val1
mov bl,val2
div bl

mov q,al
mov r,ah

mov al,r
;compare
cmp al,a
je l1

mov dx,offset str2
mov ah,9
int 21h

mov ah,4ch
int 21h

l1:
mov dx,offset str1
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
