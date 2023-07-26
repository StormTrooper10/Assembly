.model small

.stack 100h

.data



.code



mov bl, 0
mov bh, 0
mov cx, 11

L1:

cmp cx, 0
je L2
add bh, bl
inc bl
loop L1

L2:

;AX = BH
mov ah, 0
mov al, bh		;We cannot save value of bh in ax directly, because size mismatch. So lower 8 bits of ax = bh, higher 8 bits = 0. Hence bh copied to ax.

				;251		251/10=25 Q   1 R

mov bl, 10
div bl			;ax/bl   Result:  al=Quotient	ah=Remainder
			
mov cl, ah
mov dl, al
add dl, 48

mov ah, 02h
int 21h

mov dl, cl
add dl, 48

mov ah, 02h
int 21h

mov ah,4ch
int 21h

end
