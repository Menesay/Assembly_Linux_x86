;Author: Menesay
;05/07/2022
;NASM x86_32
;Addition program
;Only works in 1 digit numbers

SYS_WRITE equ 4
SYS_READ equ 3
SYS_EXIT equ 1
STDIN equ 0
STDOUT equ 1

section .data

	msg1 dq 'Enter a digit: '0xA
	len1 equ $ - msg1

	msg2 dq 'Enter second number: '0xA
	len2 equ $ - msg2

	msg3 dq 'The sum is: '
	len3 equ $ - msg3

section .bss

	num1 resb 2
	num2 resb 2
	res resb 1

section .text

	global _start

_start:

	;write msg1
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg1
	mov edx, len1
	int 0x80

	;get input num1
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num1
	mov edx, 2
	int 0x80

	;write msg2
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, msg2
	mov edx, len2
	int 0x80

	;get input num2
	mov eax, SYS_READ
	mov ebx, STDIN
	mov ecx, num2
	mov edx, 2
	int 0x80

	;write msg3
	mov eax, SYS_WRITE
	mov ebx, SYS_READ
	mov ecx, msg3
	mov edx, len3
	int 0x80

	mov eax, [num1]
	sub eax, '0'

	mov ebx, [num2]
	sub ebx, '0'

	add eax, ebx

	add eax, '0'

	mov [res], eax

	;write the sum
	mov eax, SYS_WRITE
	mov ebx, STDOUT
	mov ecx, res
	mov edx, 1
	int 0x80

exit:
	mov eax, SYS_EXIT
	xor ebx, ebx
	int 0x80

	;end
