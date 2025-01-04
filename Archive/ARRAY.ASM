;Program to print array elements
dosseg
.model small
.stack 100h
.data
arr db 'a','b','c'   ;array elements
.code
main proc
mov ax,@data
mov ds,ax

mov si,offset arr   ;starting add of array

mov cx,3  ;loop counter value

L1:
mov dx,[si] ;printing each element

mov ah,2
int 21h
inc si
loop L1

mov ah,4ch
int 21h


main endp
end main
