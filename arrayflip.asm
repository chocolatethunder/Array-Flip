;------------------------------------------------------
; Array Flipper
; Author: Saurabh Tomar
; Written for CPSC355
; Description: This program flips the values in an array
;------------------------------------------------------

INCLUDE Irvine32.inc

; Initialize the data
.DATA
array DWORD 1,5,6,8,0Ah,1Bh,1Eh,22h,2Ah,32h

.CODE
;------------------------------------------------------
; flip
; Takes an array and reverses it in place using the EAX and EBX registers
; Recieves: 1 array
; Returns: 1 array 
;------------------------------------------------------
flip PROC
	
	; Initialize the temp registers to take the data. Set ESI to point
	; at the begining of an array and set EDI to point at the begining of 
	; the last element of the array. Set the counter to half the size of the array
	mov ESI,0
	mov EDI,0
	mov ESI, OFFSET array
	mov EDI, OFFSET array + ((LENGTHOF array - 1) * SIZE array)
	mov ECX, LENGTHOF array/2

	; Start looping through the array. Temp store the first element 
	; in EAX and last element in EBX. Replace the value at [ESI] (first element) 
	; with the last in EBX and vice versa with [EDI] and EAX.
	L1:
		mov EAX,[ESI]
		mov EBX,[EDI]
		mov [ESI],EBX
		mov [EDI],EAX	

		; Increment the ESI to the next element
		add ESI,TYPE array
		; Decrement the EDI to the previous element
		sub EDI,TYPE array
	loop L1

	; Setup to display the reversed array
	mov EDI, OFFSET array
	mov ECX, LENGTHOF array

	; Loop through and display the Hex elements of the array
	L2:
		mov EAX,[EDI]
		add EDI,TYPE array
		call WriteHex
		call Crlf
	loop L2

	call WaitMsg

	exit

flip ENDP
END flip 
