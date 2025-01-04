dosseg
.model small
.stack 100h
.data
str db 'parallelogram$'
val1 db 1
val2 db 23
val3 db 21
.code
main proc
mov ax,@data
mov ds,ax

mov ah,6
mov al,1
mov bh,11000010b
mov ch,0
mov cl,0
mov dh,25
mov dl,20
int 10h

l1:
mov ah,6
mov al,1
mov bh,11000011b
mov ch,0
mov cl,val1
mov dh,val2
mov dl,val3
int 10h
inc val1
sub val2,1
inc val3
cmp val1,8
jne l1

mov dx,offset str
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
