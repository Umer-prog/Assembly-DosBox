dosseg
.model small
.stack 100h
.data
space1 dw 1
space2 dw 1
inner dw 1
inner2 dw 7
val1 dw '1'
val2 dw '1'
.code
main proc

mov ax,@data
mov ds,ax

mov cx,7

l1:
push cx

;mov cx,space1
;l2:

;mov dx,' '
;mov ah,2
;int 21h

;loop l2

;inc space1
mov cx,inner
l3:

mov dx,val1
mov ah,2
int 21h
inc val1
loop l3
mov val1,'1'
;inc val1
mov bx,1
add inner,bx


;mov cx,space2
;l4:

;mov dx,' '
;mov ah,2
;int 21h

;loop l4

;mov bx,2
;add space2,bx

;mov cx,inner2
;l5:

;mov dx,val2
;mov ah,2
;int 21h

;loop l5
;inc val2
;mov bx,1
;sub inner2,bx


mov dx,10
mov ah,2
int 21h

mov dx,13
mov ah,2
int 21h


pop cx
loop l1

mov ah,4ch
int 21h

main endp
end main
