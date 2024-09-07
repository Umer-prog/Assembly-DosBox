dosseg
.model small
.stack 100h
.data
space dw 1
inner dw 11

.code
main proc

mov ax,@data
mov ds,ax

mov cx,6

l1:
push cx

mov cx,space
l2:

mov dx,' '
mov ah,2
int 21h

loop l2

inc space
mov cx,inner
l3:

mov dx,'*'
mov ah,2
int 21h

loop l3

mov dx,10
mov ah,2
int 21h

mov dx,13
mov ah,2
int 21h

mov bx,2
sub inner,bx

pop cx
loop l1

mov ah,4ch
int 21h

main endp
end main
