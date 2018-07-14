
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
str_value: db '64-bit ASM: ', 0
add_value: db ' written by Jared ', 0
section .text

global _start
extern print_string
extern string_len

_start:
	mov rdi, arr_value
	mov rbx, str_value
	call string_copy
	mov rbx, add_value
	call string_copy
	mov rsi, arr_value
	call print_string
	exit_program 0

; rdi - location
; rbx - string two
string_copy:
	call string_len
	mov rcx, rax
	mov rax, 0
.loop0:
	mov dl, byte [rbx+rax]
	mov byte [rdi+rcx], dl
	inc rcx
	cmp byte [rbx+rax], 0
	je .over0
	inc rax
	jmp .loop0
.over0:
	ret

