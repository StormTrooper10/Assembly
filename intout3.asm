.MODEL SMALL

.STACK 100H
.386
count = 80
KEYBOARD STRUCT
	
	maxInput BYTE count 		 ;max chars to input
	inputCount BYTE ?	 	 	 ;actual input 
	buffer BYTE count DUP(?)	 ;holds input chars
	
KEYBOARD ENDS
.DATA
	
	kybdData KEYBOARD <>

.CODE	
	mov ax,@data
	mov ds,ax
	
	mov ah,0Ah
	mov dx,OFFSET kybdData
	int 21h
	
	
	mov ah,40h
	mov bx,1
	mov cx,SIZEOF kybdData
	mov dx,OFFSET kybdData
	int 21h
	
	end