;program to check if 2 numbers are equal or not
dosseg
.model small
.stack 100h
.data
msg1 db 10,13,'Number is equal$'
msg2 db 10,13,'Number is not equal$'
.code
main proc
mov ax,@data
mov ds,ax

;first val
mov dl,'3'

;input second val
mov ah,1
int 21h

;comparing
cmp al,dl
je l1

;output message 2
mov dx,offset msg2
mov ah,9
int 21h

mov ah,4ch
int 21h

l1:
mov dx,offset msg1
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
