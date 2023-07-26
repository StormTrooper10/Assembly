.MODEL SMALL

.STACK 100H

.DATA

var1 DW 0
count DW 0

.CODE



MOV AX, @DATA
MOV DS, AX

INPUT: 

mov ah,01
int 21h
cmp al,13
JE REINPUT

sub al,48
mov cl,al
mov ax,00
mov ax,var1
mov bl,10
mul bl
add ax,cx
mov var1,ax
JMP INPUT

REINPUT:
mov ax,var1
JMP OUTPUT

OUTPUT:
CMP ax,0
JNE L2
JE L1

L1:
cmp count,0
JE EXIT
POP DX
ADD DX, 48
MOV AH,02h
int 21h
dec count
JMP L1

L2:
mov bl,10
div bl
mov cl,ah
mov bl,al
PUSH CX
mov ax,00
mov ax,bx
inc count
JMP OUTPUT

EXIT:
mov ah,4ch
int 21h

end
