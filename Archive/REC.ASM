dosseg
.model small
.stack 100h
.data
str db 'RECTANGLE$'
.code
main proc
mov ax,@data
mov ds,ax

mov ah,6  ;setting function
mov al,6  ;setting height

mov bh,11000110b ;setting color

mov ch,0   ;starting val
mov cl,0

mov dh,40   ;ending val
mov dl,40
int 10h

mov dx,offset str  ;string output
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
