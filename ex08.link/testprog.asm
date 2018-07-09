
%define EXIT_CODE 60

%macro exit_program 1
	mov rax, EXIT_CODE
	mov rdi, %1
	syscall
%endmacro

section .data

section .text

global main
extern testprog

main:
	call testprog
	exit_program 0
