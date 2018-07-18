
; concat strings 

%define EXIT_CODE 60

%macro exit_program 1
	mov rax,EXIT_CODE
	mov rdi, %1
	syscall
%endmacro

section .bss
arr_value: resb 255
section .data
filename: db 'print.asm', 0

section .text

global main
extern readfile

main:
	mov rdi, filename
	call readfile
	exit_program 0


