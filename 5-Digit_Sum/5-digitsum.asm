;Author: Menesay
;08/07/2022
;NASM x86_32
;Sums 2 5-digit numbers
;For 64-bit compile:
;nasm -f elf 5-digitsum.asm
;ld -m elf_i386 -s -o  5-digitsum 5-digitsum.o

section .data

msg db 'The sum is: ',0xa
len equ $ - msg

num1 db '12345'
num2 db '12345'
sum db '     ' ;5-digit space

section .text

	global _start

_start:
	mov esi, 4
	mov ecx, 5 ;digit number
	clc
_loop:

	mov al, [num1 + esi]
	adc al, [num2 + esi]
	aaa	;not support 64-bit
	pushf
	or al, 30h
	popf
	mov [sum + esi], al
	dec esi
	loop _loop

	mov eax, 4
	mov ebx, 1
	mov ecx, msg
	mov edx, len
	int 0x80

	mov eax, 4
	mov ebx, 1
	mov ecx, sum
	mov edx, 5
	int 0x80

	mov eax, 1
	int 0x80 
