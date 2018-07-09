
section .data

hello_world: db 'Hello, World!', 0

section .text

global _start
extern print_string

_start:
	mov rsi, hello_world
	call print_string
	mov rax, 60
	xor rdi, rdi
	syscall
