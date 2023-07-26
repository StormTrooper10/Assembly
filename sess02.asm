.MODEL SMALL		;Whole program and data will reside in same segment in RAM
.STACK 300H
.386 
.DATA
V1	DD 9AAAAAABh
V2	DD 0BABEF01h
R DW ?
.CODE
;include Irvine16.inc
start:

mov ax, @data	; initialize DS data segment address
mov ds, ax

mov ax, WORD PTR V1		
mov bx, WORD PTR V2
add ax, bx 

mov WORD PTR R, ax

mov ax, WORD PTR V1+2
mov bx, WORD PTR V2+2
adc ax, bx

mov WORD PTR R+2, ax

jnc no_carry

;Do something if carry
mov dx, 0
adc dx, 0
mov WORD PTR R+4, dx

no_carry:

mov ah,02h
int 21h
mov ah, 4Ch     ; "terminate program" 
int 21h



END