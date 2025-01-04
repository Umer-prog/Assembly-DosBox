;program to reverse string
dosseg
.model small
.stack 100h
.data
str db 10,13,'i am a string$'
.code
main proc
mov ax,@data
mov ds,ax
mov si,offset str
mov cx,15

L1:
mov bx,[si]
push bx
inc si
loop L1

mov cx,15

L2:
pop dx
mov ah,2
int 21h
loop L2

mov ah,4ch
int 21h
main endp
end main
