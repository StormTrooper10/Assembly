;AX = 16 Bit		AH & AL are 8bits each

;WORD = 16bits
;DWORD = 32 bits

;char ASCII Codes:	0 = 48	1 = 49 .. 9 = 57
;
;Digit Output 256
;256 % 10 = 6 > store it in string
;256 / 10 = 25

;25 % 10 = 5 > store it in string
;25 / 10 = 2

;2 % 10 = 2 > store it in string
;2 / 10 = 0 >>End point

;String = "652"
;Reverse the String: "256"
;Now display it

.MODEL SMALL		;Whole program and data will reside in same segment in RAM
.STACK 300H
.386 
.DATA
MSG DB 'Hi',13,10,'$'
V1	BYTE 134
V2	BYTE 35

.CODE
start:

;String output
mov ax, @data	; initialize DS
mov ds, ax
mov ah, 9
mov dx, OFFSET msg
int 21h 

;DIVIDE
MOV AX, 0		;AH = 0	& AL = 0
MOV AL, V1
MOV BL, 2
DIV BL	;AX/ BL
;Return: AL: Quotient	AH: Remiander

;Print char: Set ASCII Code in DL
MOV AH, 2H
MOV DL, AL
INT 21H


mov ah, 4Ch     ; "terminate program" 
int 21h



END