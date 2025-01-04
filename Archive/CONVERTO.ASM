dosseg
.model small
.stack 100h

.data
input db 'Enter a decimal value (0-255): $'
output db 10,13,'The binary value is: $'
decimal dw 170
binary dw 8 dup(0)
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
;mov ah,1
;int 21h
;mov decimal,al

mov bx,2

;dividing value by 2
mov ax,decimal
mov dx,0
div bx
mov q,ax

add dx,48
mov r,dx
push r

mov cx,7 ;loop counter for 7 bits

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

;code is perfect till now!!!!!!


;testing
;mov cx,8     
;print
;pop r
;mov dx,r
;mov ah,2
;int 21h
;loop print

mov si,offset binary
mov cx,8

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
mov cx,8
l1:
mov dx,[si]
mov ah,2
int 21h
inc si
loop l1

mov ah,4ch
int 21h

main endp
end main
