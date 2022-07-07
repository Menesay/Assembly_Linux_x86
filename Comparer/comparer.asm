;Author: Menesay
;06/07/2022
;NASM x86_32
;Find largest one
;Only works in 0-50


section .data

	msg db 'The largest digit is: ',0xA,0xD
	len equ $ - msg

	num1 dd '43'
	num2 dd '12'
	num3 dd '26'

section .bss

	largest resb 2

section .text

	global _start

_start:

	mov ecx, [num1]
	cmp ecx, [num2]
	jg compare_two
	mov ecx, [num2]

compare_two:

	cmp ecx, [num3]
	jg _exit
	mov ecx, [num3]

_exit:
	mov [largest], ecx
	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, largest
	mov edx, 2
	int 0x80

	mov eax, 1
	int 0x80


