TITLE      (.asm)

; This program
; Last update:

Include Irvine16.inc
includelib Irvine16.lib
.data
message BYTE "Hello, world!",0dh,0ah

.code
main PROC
	mov ax,@data
	mov ds,ax

	
	mov dx,OFFSET message ; addr of buffer
	call WriteString
	
	mov eax, 25
	call WriteInt		;Print value in eax


	exit
main ENDP
END main
