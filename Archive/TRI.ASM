dosseg
.model small
.stack 100h
.data
str db 'TRIANGLE$'
num db 0
.code
main proc
mov ax,@data
mov ds,ax

L1:
mov ah,6   ;setting function
mov al,1   ;setting height

mov bh,10010011b ;setting color

mov ch,0  ;starting val
mov cl,0

mov dh,25  ;ending val
mov dl,num

int 10h
inc num
cmp num,20
jne L1

mov dx,offset str
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
