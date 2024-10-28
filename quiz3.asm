; CISC 211
; Quiz 3
; Dylan Winn 2024-10-28

section .text
	global _start

_start:

; question 1:
; calculates a factorial of a pre-defined number
; 5! = 5 * 4 * 3 * 2 * 1 = 120
setup:
	mov eax, 1		; multiplicand & result accumulator, initialize to 1
	mov ecx, [input]	; loop counter, initialize to number we are going to factorialize

loop:
	mov edx, ecx	; set multiplier to counter value (5, 4, 3, 2, 1)
	mul edx		; unsigned multiply eax (accumulator) times edx (counter), result goes in eax
	loop loop	; decrement counter and loop until ecx is zero

	mov [result], eax	; store result

exit:
	mov eax, 1
	mov ebx, 0
	int 0x80

section .bss
	result resd 1	; result will be put here

section .data
	input dd 5	; pre-defined number to factorialize
