TITLE      (.asm)

;x86 is 32 bit OS
;DB - Define Byte. 8 bits
;DW - Define Word. Generally 2 bytes on a typical x86 32-bit system
;DD - Define double word. Generally 4 bytes on a typical x86 32-bit system
;DQ - 8 Bytes. 64 Bits
;DT - 16 Bytes. 128 Bits
;DB, DW, DD, DQ, DT, DDQ, and DO 
;AX, BX etc: 2 Bytes = 16 bits
;EAX, EBX 4 Bytes = 32 Bits

Include Irvine16.inc
includelib Irvine16.lib
.data
message BYTE "Result: ",0dh,0ah,0
V1	DQ 0FAAAAAABFAAAAAABh		;				   FAAAAAAB FAAAAAAB
V2	DQ 0FBABEF01FBABEF01h		;				   FBABEF01 FBABEF01
R DT 0							;-------- -------- -------- --------

.code
main PROC
	mov ax,@data
	mov ds,ax

	
	mov eax, DWORD PTR V1		;Move 1st 4 bytes from base location of V1 into eax
	mov ebx, DWORD PTR V2		;Move 1st 4 bytes from base location of V2 into ebx
	add eax, ebx 
	
	mov DWORD PTR R, eax		;Move value of eax into 1st 4 bytes of R

	mov eax, DWORD PTR V1+4		;Move 1st 4 bytes from base location + 4 bytes of V1 into eax
	mov ebx, DWORD PTR V2+4		;Move 1st 4 bytes from base location + 4 bytes of V2 into ebx
	adc eax, ebx
	
	mov DWORD PTR R+4, eax		;Move value of eax into 1st 4 bytes of R + 4 bytes
	
	;Carry will not be greater than 1. It would be either 1 or 0
	
	jnc skip_add
	mov DWORD PTR R+8, 1
skip_add:
	
	;Capture the carry 
	;mov eax, 0
	;mov ebx, 0
	;adc eax, ebx				;eax = carry
	
	;mov DWORD PTR R+8,eax
	
	
	
	
	
	
	
	mov dx,OFFSET message ; addr of buffer
	call WriteString
	
	mov eax, DWORD PTR R+8
	call WriteHex
	
	mov eax, DWORD PTR R+4
	call WriteHex	;Print value in eax
	
	mov eax, DWORD PTR R
	call WriteHex		;Print value in eax


	exit
main ENDP
END main
