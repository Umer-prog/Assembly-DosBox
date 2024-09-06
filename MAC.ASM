;program containgy procedure and macro
dosseg
;macro start
print macro p1        ;macro for printing string
mov dx,offset p1      ;moving thre parameter in for printing
mov ah,9
int 21h
endm
;macro end

.model small
.stack 100h
.data
str1 db 'hello,$'
str2 db 'how are you.$'
str3 db 'hope you are fine$'

.code

;main procedure starting
main proc
mov ax,@data
mov ds,ax

print str1      ;printing first string
call enterkey      

print str2      ;printing second string
call enterkey

print str3      ;printing third string
call enterkey

mov ah,4ch
int 21h

main endp

;Enter key procedure
enterkey proc
mov dx,10
mov ah,2
int 21h

mov dx,13
mov ah,2
int 21h
ret
enterkey endp
end main
