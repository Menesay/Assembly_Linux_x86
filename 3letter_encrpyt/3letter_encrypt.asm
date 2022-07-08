;Author: Menesay
;08/07/2022
;NASM x86_32
;3 letter shifting encryption from Alphabet
;password --> sdvvzrug

section .data

s1 db 'password',0 ;source
len equ $ - s1

section .bss

s2 resb 10 ;destination

section .text
	global _start

_start:
	mov ecx, len
	mov esi, s1 ;source
	mov edi, s2 ;destination

loop_:
	lodsb
	add al, 3 ;shift 3
	stosb
	loop loop_
	cld
	rep movsb ;Repeat until eax (len) = 0

	mov eax, 4
	mov ebx, 1
	mov ecx, s2
	mov edx, 20
	int 0x80

	mov eax, 1
	int 0x80
