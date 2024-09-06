;square
dosseg
.model small
.stack 100h
.data
str db 'SQUARE$'
.code
main proc
mov ax,@data
mov ds,ax

mov ah,6   ;setting function 
mov al,10  ;setting no of lines

mov bh,10110100b ;color value

mov ch,0   ;starting values
mov cl,0

mov dh,25  ;ending values
mov dl,25

int 10h

mov dx,offset str
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
