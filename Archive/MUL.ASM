;program to multiply 2 numbers and output result
dosseg
.model small
.stack 100h
.data
.code
main proc
mov al,5  ;first val
mov bl,9  ;second val

;multiplying 2 values
mul bl
aam

mov ch,ah
mov cl,al

;printing
mov dl,ch
add dl,48
mov ah,2
int 21h

mov dl,cl
add dl,48
mov ah,2
int 21h

mov ah,4ch
int 21h
main endp
end main
