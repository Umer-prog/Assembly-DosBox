;program reverse input string
dosseg
.model small
.stack 100h

.data
str db 20 dup('$')

.code
main proc
mov ax,@data
mov ds,ax

mov si,offset str
;string input
L1:
mov ah,1
int 21h
cmp al,13
je progend

;storing val in array
mov [si],ax
inc si
jmp L1

progend:
mov dx,offset str
mov si,offset str

;push val to stack
mov cx,20
L2:
mov bx,[si]
push bx
inc si
loop L2

;pop val from stack
mov cx,20
L3:
pop dx
mov ah,2
int 21h
loop L3

mov ah,4ch
int 21h

main endp
end main



main endp
end main
