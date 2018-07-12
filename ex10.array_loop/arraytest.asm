
; fill array with A-Z through loop

%define EXIT_CODE 60

%macro exit_program 1
	mov rax,EXIT_CODE
	mov rdi, %1
	syscall
%endmacro

section .bss
arr_value: resb 255

section .data
str_value: db 'Characters: ', 0

section .text

global _start
extern print_string

_start:
	mov rax, 0
	mov rbx, 65
	mov rcx, arr_value
.loop:
	cmp rbx, 91
	je .over
	mov byte [rcx+rax],bl
	inc rax
	inc rbx
	jmp .loop
.over:
	mov rsi, str_value
	call print_string
	mov rsi, arr_value
	call print_string
	exit_program 0

