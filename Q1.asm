.MODEL SMALL
.STACK 100H
.data
v1 WORD 2000h
v2 WORD 0100h
.code

mov ax,v1 ; AX = 2000h
mul val2

end