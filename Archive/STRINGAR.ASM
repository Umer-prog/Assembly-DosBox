;program to print array of input strings
dosseg
.model small
.stack 100h
.data
arr db 50 dup('$') ;making an array of 50
str1 db 10,13,'Enter how many friends you have? $'
str2 db 10,13,'Enter your friends name: $'
str3 db 10,13,'Friends: $'
.code
main proc

mov ax,@data
mov ds,ax

mov dx,offset str1 ;promting first message
mov ah,9
int 21h

mov ah,1 ;asking for how many friends
int 21h
sub al,48

mov cl,al  ;setting counter value
mov si,offset arr
friends: ;loop
mov dx,offset str2 ;message for frend name
mov ah,9
int 21h

inpt:
mov ah,1  ;first letter input
int 21h
cmp al,13  ;comparing if enter key is pressed

je nxt    ;jumping to next input if enter is pressed
mov [si],al  ;storing char in array
inc si       ;next pointer
jmp inpt     ;next char
nxt:         ;if enter pressed loop ends
loop friends

mov dx,offset str3 ;output message
mov ah,9
int 21h

mov dx,offset arr  ;output array
mov ah,9
int 21h

mov ah,4ch
int 21h

main endp
end main
