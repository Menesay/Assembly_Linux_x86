;Author: Menesay
;06/07/2022
;NASM x86_32
;Gets 2 number and writes largest one
;2 digit

section .data

	msg1 db 'Enter a number:'
	len1 equ $ - msg1
	
	msg2 db 'Enter second number:'
	len2 equ $ - msg2
	
	msg3 db 'The larger number is:'
	len3 equ $ - msg3
	
	
section .bss

	largest resb 2
	num1 resb 2
	num2 resb 2
	
section .text

	global _start
	
_start:
	;write msg1
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, len1
	int 0x80	
	
	;get num1
	mov eax, 3
	mov ebx, 2
	mov ecx, num1
	mov edx, 5 ; Note for me: its should be 5 not 2 !
	int 0x80
	
	;write msg2
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, len2
	int 0x80
	
	;get num2
	mov eax, 3
	mov ebx, 2
	mov ecx, num2
	mov edx, 5 ; Note for me: its should be 5 not 2!
	int 0x80
	
	;write msg3
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, len3
	int 0x80
	
	;calculate largest number
	
	mov ecx, [num1]
	cmp ecx, [num2]
	jg _exit
	mov ecx, [num2]

_exit:
	
	;write largest
	mov [largest], ecx
	mov eax, 4
	mov ebx, 1
	mov ecx, largest
	mov edx, 2
	int 0x80 
	
	mov eax, 1
	int 0x80
	
	

	