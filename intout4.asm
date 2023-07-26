.MODEL SMALL

.STACK 100H
.386


.DATA

.CODE	

	;READSTRING
	push cx
	push si
	push cx
	mov si,dx
	
L1: mov ah,1
	int 21h
	cmp al,0Dh
	je L2
	mov[si],al
	inc si
	loop L1
	
L2: mov byte ptr [si],0
	pop ax
	sub ax,cx
	pop si
	pop cx
	
	
	
	;WRITESTRING
	
	pusha
	push ds
	pop es
	mov di,dx  ;STR_Length starts
	mov eax,0  ;char count
	
L3: cmp BYTE PTR [edi],0
	je L4
	inc edi
	inc eax
	jmp L3
	
L4: mov cx,ax
	mov ah,40h
	mov bx,1
	int 21h
	popa
	
	.EXIT
	end