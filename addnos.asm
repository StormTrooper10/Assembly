TITLE      (.asm)

;DB - Define Byte. 8 bits
;DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
;DD - Define double word. Generally 4 bytes on a typical x86 32-bit system
;DQ - 8 Bytes. 64 Bits
;AX, BX etc: 2 Bytes = 16 bits

Include Irvine16.inc
includelib Irvine16.lib
.data
message BYTE "Result: ",0dh,0ah,0
V1	DD 0AAAAAABh
V2	DD 0BABEF01h
R DD ?

.code
main PROC
	mov ax,@data
	mov ds,ax

	
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








	
	mov dx,OFFSET message ; addr of buffer
	call WriteString
	
	mov eax, R
	call WriteInt		;Print value in eax


	exit
main ENDP
END main
