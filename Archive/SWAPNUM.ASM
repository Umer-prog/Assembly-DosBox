; program to swap 2 numbers
dosseg
.model small
.stack 100h
.data
.code
main proc
mov ax,'4'
push ax  ;val of ax is copied in stack

mov bx,'3'
push bx  ;val of bx is copied in stack

pop ax   ;top val goes in ax
pop bx   ;top val goes in bx

mov dx,ax  ;printing ax
mov ah,2   
int 21h

mov dx,bx  ;printing bx
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
