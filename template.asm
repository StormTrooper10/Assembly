.model small

.stack 100h

.data


.code
_start:

	mov ax,@data
	mov ds,ax
	
	

	mov ah,4ch	;Terminate Program
	int 21h


end _start