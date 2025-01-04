dosseg
.model small
.stack 100h
.data
sum db ?
.code
main proc
mov ax,@data
mov ds,ax
mov al,5
;mov bl,
add al,6
mov sum,al
mov al,sum
mov bl,1
mul bl
aam
mov ch,ah
mov cl,al
mov dl,ch
add dl,48
mov ah,2
int 21h
mov dl,cl
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h

main endp
end main
