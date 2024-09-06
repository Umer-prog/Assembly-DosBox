dosseg
.model small
.stack 100h
.data
q db ?
r db ?

.code
main proc
mov ax,@data
mov ds,ax

mov ax,27
mov bl,5
div bl

mov q,al
add q,48

mov r,ah
add r,48
mov dl,q
mov ah,2
int 21h
mov dl,r
mov ah,2
int 21h

main endp
end main
