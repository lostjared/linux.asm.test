
%define EXIT_CODE 60

%macro exit_program 1
	mov rax,EXIT_CODE
	mov rdi, %1
	syscall
%endmacro

section .bss
value: resb 5

section .data

str_value: db '123', 0

section .text

global _start
extern print_string

_start:
	mov rax, 0
	mov rbx, str_value
	mov rcx, value
.loop:
	cmp byte [rbx+rax], 0
	je .over
	mov dl,  byte [rbx+rax]
	inc dl
	mov byte [rcx+rax],dl
	inc rax
	jmp .loop
.over:
	mov rsi, value
	call print_string
	exit_program 0

