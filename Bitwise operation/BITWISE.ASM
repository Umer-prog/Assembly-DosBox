
DOSSEG
.MODEL SMALL
.STACK 100H
.DATA
d1 dw 111b
d2 dw 100b
.CODE

MAIN PROC
mov ax,@data
mov ds,ax

MOV Bx,d1
or Bx,d2 ; first the value is compared with and gate
ADD Bx,48
MOV Dx,Bx
MOV AH,2
INT 21H

MOV AH,4CH
INT 21H

MAIN ENDP
END MAIN

