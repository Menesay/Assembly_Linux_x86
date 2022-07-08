;Author: Menesay
;08/07/2022
;NASM x86_32
;Writes 1-9 numbers

section .bss

	num resb 1

section .text

	global _start

_start:

	mov ecx, 10
	mov eax, '1'

l1:
	mov [num], eax
	mov eax, 4
	mov ebx, 1
	push ecx ;Not support 64-bit

	mov ecx, num
	mov edx, 1
	int 0x80

	mov eax, [num]
	sub eax, '0' ;convert decimal
	inc eax      ;i++
	add eax, '0' ;convert ASCII
	pop ecx	;Not support 64-bit
	loop l1

	mov eax, 1
	int 0x80
