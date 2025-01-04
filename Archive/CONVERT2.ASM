dosseg
con macro deci

mov bx,2

;dividing value by 2
mov ax,deci
mov dx,0
div bx
mov q,ax

add dx,48
mov r,dx
push r

mov cx,2 ;loop counter for 7 bits

;converting remaining bits
convert:     ;loop start
mov ax,q     ;moving quo to ax again 
mov dx,0
div bx
mov q,ax     ;moving the quo value to variable q

add dx,48    ;converting to ASCII
mov r,dx
push r      ;pushing to stack

loop convert

mov si,offset binary
mov cx,3

;extracting stack to  array
extract:
pop dx
mov [si],dx
inc si               ;++ si value
loop extract

;printing output
mov dx,offset output
mov ah,9
int 21h

;printing array
mov si,offset binary
mov cx,3
l1:
mov dx,[si]
mov ah,2
int 21h
inc si
loop l1

endm

convo macro decim

mov bx,2

;dividing value by 2
mov ax,decim
mov dx,0
div bx
mov quo,ax

add dx,48
mov rem,dx
push rem

mov cx,2 ;loop counter for 7 bits

;converting remaining bits
convert2:     ;loop start
mov ax,quo     ;moving quo to ax again 
mov dx,0
div bx
mov quo,ax     ;moving the quo value to variable q

add dx,48    ;converting to ASCII
mov rem,dx
push rem      ;pushing to stack

loop convert2

mov si,offset bin
mov cx,3

;extracting stack to  array
extract2:
pop dx
mov [si],dx
inc si               ;++ si value
loop extract2

;printing output
mov dx,offset output
mov ah,9
int 21h

;printing array
mov si,offset bin
mov cx,3
l2:
mov dx,[si]
mov ah,2
int 21h
inc si
loop l2

endm

.model small
.stack 100h

.data
input db 'Enter a decimal value (0-7): $'
output db 10,13,'The binary value is: $'
decimal dw ?
decimal2 dw ?
binary dw 000b
bin dw 000b
rem dw ?
quo dw ?
r dw ?
q dw ?

.code
main proc
mov ax,@data
mov ds,ax

;prompt for decimal input
mov ah,9
lea dx,input
int 21h

;read decimal input
mov ah,1
int 21h
mov decimal,al


con decimal
;prompt for decimal input
mov ah,9
lea dx,input
int 21h

;read decimal input
mov ah,1
int 21h
mov decimal2,al

convo decimal2
mov bx,binary
and bx,bin
;add bx,48
mov dx,bx

mov ah,2
int 21h


mov ah,4ch
int 21h

main endp
end main
