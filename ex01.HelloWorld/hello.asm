
section .data
message: db 'Hello, World!', 10

section .text
global _start

_start:
	mov rbx, 0x0
.loop0:
	mov rax, 1
	mov rdi, 1
	mov rsi, message
	mov rdx, 14
	syscall
	inc rbx
	cmp rbx, 0xa
	jne .loop0
	mov rax, 60
	xor rdi, rdi
	syscall
