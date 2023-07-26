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
	
	mov DWORD PTR R+8, 0

	
	mov DWORD PTR R+4, 0
		
	
	mov DWORD PTR R, 0
	
	mov eax, DWORD PTR R+8
	call WriteHex
	
	mov eax, DWORD PTR R+4
	call WriteHex	;Print value in eax
	
	mov eax, DWORD PTR R
	call WriteHex		

	
	
		
	
	
	mov ax, WORD PTR V1		;Move 1st 2 bytes from base location of V1 into ax
	mov bx, WORD PTR V2		;Move 1st 2 bytes from base location of V2 into bx
	add ax, bx 
	
	mov WORD PTR R, ax		;Move value of ax into 1st 2 bytes of R

	mov ax, WORD PTR V1+2		;Move 1st 2 bytes from base location + 2 bytes of V1 into ax
	mov bx, WORD PTR V2+2		;Move 1st 2 bytes from base location + 2 bytes of V2 into bx
	adc ax, bx
	
	mov WORD PTR R+2, ax	;Move value of ax into 1st 2 bytes of R + 2 bytes
	
	mov ax, WORD PTR V1+4		;Move 1st 2 bytes from base location + 2 bytes of V1 into ax
	mov bx, WORD PTR V2+4		;Move 1st 2 bytes from base location + 2 bytes of V2 into bx
	adc ax, bx
	
	mov WORD PTR R+4, ax


	mov ax, WORD PTR V1+6		;Move 1st 2 bytes from base location + 2 bytes of V1 into ax
	mov bx, WORD PTR V2+6		;Move 1st 2 bytes from base location + 2 bytes of V2 into bx
	adc ax, bx
	
	mov WORD PTR R+6, ax		
	;Carry will not be greater than 1. It would be either 1 or 0
	
	jnc skip_add
	
	mov WORD PTR R+8, 1
	
	COMMENT !
	Capture the carry 
	mov ax, 0
	mov bx, 0
	adc ax,bx				;eax = carry
	
	mov WORD PTR R+8,ax
	fjnjfn
	!
	
skip_add:
	
	
	
	
	
	
	
	
	
	mov dx,OFFSET message ; addr of buffer
	call WriteString
	
	mov eax, DWORD PTR R+8
	call WriteHex
	
	mov eax, DWORD PTR R+4
	call WriteHex	;Print value in eax
	
	mov eax, DWORD PTR R
	call WriteHex		

	exit
main ENDP
END main