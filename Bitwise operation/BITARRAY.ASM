dosseg
.model small
.stack 100h
.data
b1 dw 011b
b2 dw 101b
.code
main proc
mov ax,@data
mov ds,ax

mov bx,b1
xor bx,b2
add bx,48
mov dx,bx
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
