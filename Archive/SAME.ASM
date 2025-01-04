dosseg
.model small
.stack 100h
.data
s1 db 8 dup('$')
s2 db 5 dup('$')

.code
main proc
mov ax,@data
mov ds,ax

;--------------------------------
;input part
mov si,offset s1
l1:
mov ah,1
int 21h
cmp al,13

je l2

mov [si],al
inc si
jmp l1
mov di,offset s2
l2:
mov ah,1
int 21h
cmp al,13

je progend

mov [di],al
inc di
jmp l2


;--------------------------------
;compare part
progend:

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

