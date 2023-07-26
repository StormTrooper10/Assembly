WI_Bufsize = 12
true  =   1
false =   0
.data
buffer_B  BYTE  WI_Bufsize dup(0),0  ; buffer to hold digits
neg_flag  BYTE  ?

.code
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
	call WriteString

	popad
	ret
WriteInt ENDP

WriteString PROC
; Writes a null-terminated string to standard output
; Receives: DS:DX points to the string
; Returns: nothing
;--------------------------------------------------------
	pusha
	push ds           		; set ES to DS
	pop  es
	mov  di,dx        		; ES:DI = string ptr
	INVOKE Str_length, DX   		; AX = string length
	mov  cx,ax        		; CX = number of bytes
	mov  ah,40h       		; write to file or device
	mov  bx,1         		; standard output handle
	int  21h          		; call MS-DOS
	popa
	ret
WriteString ENDP

END