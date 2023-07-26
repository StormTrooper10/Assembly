

.MODEL SMALL
.STACK 100H
.DATA

VAR DB ?
VAR1 DB ?
VAR2 DB ?

.CODE

mov ax,@DATA
mov ds,ax

mov VAR,01h
mov dl,VAR
mov ah,01h
int 21h

mov bl,al
sub bl,48

mov VAR1,01h
mov dl,VAR1
mov ah,01h
int 21h

mov cl,al
sub cl,48

add bl,cl
add bl,48

mov dl,bl
mov ah,02h
int 21h

mov ah,4ch
int 21h


end 


