;Include Irvine16.inc
;includelib Irvine16.lib
.model small
.stack 100h
.386

WI_Bufsize = 12
true  =   1
false =   0
.data
buffer_B  BYTE  WI_Bufsize dup(0),0  ; buffer to hold digits
neg_flag  BYTE  ?
message BYTE "Result: ",0dh,0ah,0
V1	DD 1000
V2	DD 1000
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








	
	;mov dx,OFFSET message ; addr of buffer
	;call WriteString
	
	mov eax, R
	;write int starts
	pushad

	 mov   neg_flag,false    ; assume neg_flag is false
	 or    eax,eax           ; is AX positive?
	 jns   WIS1              ; yes: jump to B1
	 neg   eax               ; no: make it positive
	 mov   neg_flag,true     ; set neg_flag to true

WIS1:
	 mov   cx,0               ; digit count = 0
	 mov   di,OFFSET buffer_B
	 add   di,(WI_Bufsize-1)
	 mov   ebx,10             ; will divide by 10

WIS2:
	 mov   edx,0             ; set dividend to 0
	 div   ebx               ; divide AX by 10
	 or    dl,30h            ; convert remainder to ASCII
	 dec   di                ; reverse through the buffer
	 mov   [di],dl           ; store ASCII digit
	 inc   cx                ; increment digit count
	 or    eax,eax           ; quotient > 0?
	 jnz   WIS2              ; yes: divide again

	 ; Insert the sign.

	 dec   di	; back up in the buffer
	 inc   cx               	; increment counter
	 mov   byte ptr [di],'+' 	; insert plus sign
	 cmp   neg_flag,false    	; was the number positive?
	 jz    WIS3              	; yes
	 mov   byte ptr [di],'-' 	; no: insert negative sign

WIS3:	; Display the number
	mov  dx,di
	
	;WriteString starts
	
	pusha
	push ds           		; set ES to DS
	pop  es
	mov  di,dx        		; ES:DI = string ptr
	
	;Str_length starts
	
	mov ax,0     	; character count
L1:
	cmp byte ptr [di],0	; end of string?
	je  L2	; yes: quit
	inc di	; no: point to next
	inc ax	; add 1 to count
	jmp L1
	
L2: ret   		; AX = string length

	mov  cx,ax        		; CX = number of bytes
	mov  ah,40h       		; write to file or device
	mov  bx,1         		; standard output handle
	int  21h          		; call MS-DOS
	popa
	ret

	popad
	ret		;Print value in eax

	
	;exit
	mov ah,4ch
	int 21h
	
main ENDP
END main