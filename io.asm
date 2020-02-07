;string length calculator
;------------------------------
calcStrLength:
	push	ebx
	mov		ebx, eax
nextChar:
	cmp		byte[eax], 0
	jz		endFunc
	inc		eax
	jmp		nextChar
endFunc:
	sub		eax, ebx
	pop		ebx
	ret
;------------------------------


; stdout
;------------------------------
print:
	push	edx
	push	ecx
	push	ebx
	push	eax
	call	calcStrLength
	mov		edx, eax
	pop		eax
	mov		ecx, eax
	mov		ebx, 1
	mov		eax, 4
	int		80h
	pop		ebx
	pop		ecx
	pop		edx
	ret
;---------------------------------


;stdout with linefeed
;---------------------------------
printLF:
	call	print
	push	eax
	mov		eax, 0Ah
	push	eax
	mov		eax, esp
	call	print
	pop		eax
	pop		eax
	ret
;---------------------------------


;terminator
;---------------------------------
terminate:
	mov		ebx, 0
	mov		eax, 1
	int		80h
	ret
;---------------------------------
