;AX = 16 Bit		AH & AL are 8bits each

;WORD = 16bits
;DWORD = 32 bits

;DD : 32bits
; Max size of a carry: Carry is single hex digit Hence: 4bits
;   64     	56		48		40			32		24		16		8
;======== ======== ======== ======== ======== ======== ======== ========
;									 9A 	  AA 	   AA 	    AB			<< V1 : 32 Bits
;									 +
;									 0B	      AB       EF       01			<< V2: 32 Bits
;------------------------------------------------------------------------
;									 A6		  56 	   99		AC			<< R: 64 Bits

;Limitation: You have max register size equal of 16 Bit
;So will do addition in parts
;E.g. Dedimal No System
;  1 < carry
;  78
; +25
; ---
;  93
;


.MODEL SMALL		;Whole program and data will reside in same segment in RAM
.STACK 300H
.386 
.DATA
.CODE
_start:

mov ah, 4Ch     ; "terminate program" 
int 21h



END _start