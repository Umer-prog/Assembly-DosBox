dosseg
.model small
.stack 100h
.data
s1 db 'hassan$'
s2 db 'happy$'

.code
main proc
mov ax,@data
mov ds,ax
mov si,offset s1

mov cx,8
outter:
push cx

mov di,offset s2
mov cx,5

inner:
mov al,[si]
cmp al,[di]
jne same
mov dx,[di]

mov ah,2
int 21h

inc di


same:
inc di

loop inner

inc si
pop cx
loop outter

mov ah,4ch
int 21h

main endp
end main

