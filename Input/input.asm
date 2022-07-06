;Author: Menesay
;02/07/2022
;nasm x86_32
;Simple Input Program

section .data
	userMsg db 'Enter a number: '
	lenuserMsg equ $ - userMsg
	dispMsg db 'You have entered: '
	lendispMsg equ $ - dispMsg

section .bss
	num resb 5

section .text
	global _start

_start:
	;User Prompt 'Enter a number: '
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, lenuserMsg
	int 80h

	;Read and Storage user's input
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 80h

	;Write Message 'You have entered: '
	mov eax, 4
	mov ebx, 1
	mov ecx, dispMsg
	mov edx, lendispMsg
	int 80h

	;Write input
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 80h

	;Exit Code
	mov eax, 1
	int 80h 
