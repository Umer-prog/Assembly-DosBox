dosseg

;-----------------------------------------------------------

con macro deci
:prompt for decimal input
mov ah,9
lea dx,input
int 21h

;-----------------------------------------------------------

;dividing val by 2
mov bx,2
mov ax,decimal
mov dx,0
div bx
mov q,ax

add dx,48
mov r,dx
push r
mov cx,2 ;loop counter for 2 bits

;converting remaining bits
convert:     ;loop start
mov ax,q     ;moving quo to ax again
mov dx,0
div bx
mov q,ax

add dx,48
mov r,dx
push r

loop convert

mov si,offset binary
mov cx,3

;extracting stack to array
extract:
pop dx
mov [si],dx
inc si
loop extract
endm

;-----------------------------------------------------------

.model small
.stack 100h
.data

;-----------------------------------------------------------

project db 10,13, 'Arithematic and Logic and Unit$'


u1 db 10,13, 'Arithematic Operation$'
u2 db 10,13, 'Logical Unit$'

ao1 db 10,13, 'Addition$'
ao2 db 10,13, 'Subtraction$'
ao3 db 10,13, 'Division$'
ao4 db 10,13, 'Multiplication$'

lu1 db 10,13, 'AND$'
lu2 db 10,13, 'OR$'
lu3 db 10,13, 'NOT$'
lu4 db 10,13, 'XOR$'

TY db 10,13, 'Thank You $'

U db 0
AO db 011
LU db 101

;CONVERTER VARIABLE
input db 10,13, 'Enter number between (0-7): $'
decimal dw 5
binary dw 000b
r dw ?
q dw ?
v1 db 3
v2 db 4


;-----------------------------------------------------------
;-----------------------------------------------------------



;-----------------------------------------------------------

.code                                     
main proc
mov ax,@data
mov ds,ax

;-----------------------------------------------------------

;Project Title
mov dx,offset project
mov ah,9
int 21h

;Your input here either in register or variable

;conditions for AO and LU
; take U input here

ALU:
mov al,u ; mov U in al to compare 
cmp al,0
je Logical

cmp al,1
je Arithematic

jmp ALU ;back to ALU if input is not matched

Arithematic:
mov dx,offset u1
mov ah,9
int 21h

;take your AO input here
mov al,ao

cmp al,000
je plus

cmp al,001
je minus

cmp al,010
je multiply

cmp al,011
je divide

jmp Arithematic ; jump back to arithmatic if input  doesn't match

plus:
mov dx,offset ao1
mov ah,9
int 21h
;addition macro here

jmp pend ; move to end after operation is performed

minus:
mov dx,offset ao2
mov ah,9
int 21h
;subtraction macro here

jmp pend ; move to end after operation is performed

multiply:
mov dx,offset ao4
mov ah,9
int 21h
;Multiplication macro here

jmp pend ; move to end after operation is performed

divide:
mov dx,offset ao3
mov ah,9
int 21h
;Division macro here

jmp pend ; move to end after operation is performed

Logical:


mov dx,offset u2
mov ah,9
int 21h

;take your input here for LU
mov al,LU

cmp al,100
je andg

cmp al,101
je or_g

cmp al,110
je notg

cmp al,111
je xorg

jmp Logical

andg:
mov dx,offset lu1
mov ah,9
int 21h
;And Macro Here

jmp pend ; move to end after operation is performed

;----------------------------------------------------------------------------

or_g:

mov dx,offset lu2
mov ah,9
int 21h
;OR Macro Here
con v1
mov ax,binary
con v2
mov bx,binary
or ax,bx
mov dx,ax
add dx,48
mov ah,2
int 21h


jmp pend ; move to end after operation is performed

notg:
mov dx,offset lu3
mov ah,9
int 21h
;NOT Macro Here

jmp pend ; move to end after operation is performed

xorg:
mov dx,offset lu4
mov ah,9
int 21h
;And Macro Here

jmp pend ; move to end after operation is performed

pend:
mov dx,offset Ty
mov ah,9
int 21h

mov ah,4ch
int 21h
main endp
end main
