.model small

.stack 100h

.data
count db 0
var1 dw ?
var2 dw ?
var3 dw ?
var4 dw ?
var5 dw ?
smallest dw 100
largest dw 0
largei dw ?
smalli dw ?
array dw ?

.code
_start:

	mov ax,@data
	mov ds,ax
	;1st input
L1:
	
	mov ah,01
	int 21h
	cmp al,13
	JE L2
	
	sub al,48
	mov cl,al
	mov ax,var1
	mov bl,10
	mul bl
	mov ch,0
	add ax,cx
	mov var1,ax
	jmp L1
	;2nd input
L2:

	mov ah,01
	int 21h
	cmp al,13
	JE L3
	
	sub al,48
	mov cl,al
	mov ax,var2
	mov bl,10
	mul bl
	mov ch,0
	add ax,cx
	mov var2,ax
	jmp L2
	;3rd input
L3:
	
	mov ah,01
	int 21h
	cmp al,13
	JE L4
	
	sub al,48
	mov cl,al
	mov ax,var3
	mov bl,10
	mul bl
	mov ch,0
	add ax,cx
	mov var3,ax
	jmp L3
	;4th input
L4:

	mov ah,01
	int 21h
	cmp al,13
	JE L5
	
	sub al,48
	mov cl,al
	mov ax,var4
	mov bl,10
	mul bl
	mov ch,0
	add ax,cx
	mov var4,ax
	jmp L4
	
	;5th input
L5:

	mov ah,01
	int 21h
	cmp al,13
	JE L6
	
	sub al,48
	mov cl,al
	mov ax,var5
	mov bl,10
	mul bl
	mov ch,0
	add ax,cx
	mov var5,ax
	jmp L5
	
L6:
	mov si,0
	
	mov ax,var1
	
	mov array[si],0
	mov array[si],ax
	inc si
	inc si
	
	mov ax,var2
	mov array[si],0
	mov array[si],ax
	inc si
	inc si
	
	mov ax,var3
	mov array[si],0
	mov array[si],ax
	inc si
	inc si
	
	mov ax,var4
	mov array[si],0
	mov array[si],ax
	inc si
	inc si
	
	mov ax,var5
	mov array[si],0
	mov array[si],ax
	inc si
	inc si
	mov si,0
		
L7:
	cmp si,10
	je outputl
	jmp large
	
cont:

	inc si
	inc si
	
	jmp L7
	
large:

	mov ax,array [si]
	cmp ax,largest
	ja L8
	jb L9
	
L8:

	mov largest,ax
	mov largei,si

L9:
	
	jmp cont
	

outputl:
	
	mov count,0
	mov ax,largest
	
L10:

	 ;push loop
	cmp ax,0
	je L11
	mov bl,10
	div bl
	mov cl,ah
	mov ch,0
	push cx
	mov bl,al
	mov bh,0
	mov ax,bx
	inc count
	jmp L10
	
L11:

	cmp count,0
	je L12
	pop dx
	add dx,48
	mov ah,02h
	int 21h
	
	dec count
	jmp L11
	
L12:

	mov dl,32
	mov ah,02h
	int 21h
	mov ax,largei
	mov bl,2
	div bl
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	mov dl,13
	mov ah,02h
	int 21h
	jmp L13
	
L13:
	mov si,0
	
L14:
	
	cmp si,10
	je outputs
	jmp small
	
cont2:
	
	inc si
	inc si
	jmp L14
	
small:

	mov ax,array[si]
	cmp ax,smallest
	jb L15
	ja L16
	
L15:
	
	mov smallest,ax
	mov smalli,si
	
L16:
	jmp cont2
	
outputs:

	mov count,0
	mov ax,smallest

L17:

	;push loop again
	cmp ax,0
	je L18
	mov bl,10
	div bl
	mov cl,ah
	mov ch,0
	push cx
	mov bl,al
	mov bh,0
	mov ax,bx
	inc count
	jmp L17
	
L18:

	cmp count,0
	je L19
	pop dx
	add dx,48
	mov ah,02h
	int 21h
	dec count
	jmp L18
	
L19:
	mov dl,32
	mov ah,02h
	int 21h
	mov ax,smalli
	mov bl,2
	div bl
	mov dl,al
	add dl,48
	mov ah,02h
	int 21h
	jmp exit
	
exit:

	mov ah,4ch
	int 21h
	
	end
			
