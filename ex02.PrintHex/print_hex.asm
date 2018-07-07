section .data

newline_char: db 10
digits: db '0123456789ABCDEF'

section .text
global _start

print_newline:
	mov rax, 1
	mov rdi, 1
	mov rsi, newline_char
	mov rdx, 1
	syscall
	ret

print_hex:
	mov rax, rdi
	mov rdi, 1
	mov rdx, 1
	mov rcx, 64
iterate:
	push rax
	sub rcx, 4
	sar rax,cl
	and rax,0xf
	lea rsi, [digits +  rax]
	mov rax,1
	push rcx
	syscall
	pop rcx
	pop rax
	test rcx, rcx
	jnz iterate
	ret
_start:
	mov rax, 10
.loop1:
	push rax
	mov rdi, 0xFFFFFFFF00AABBCC
	call print_hex
	call print_newline
	pop rax
	dec rax
	cmp rax, 0
	jne .loop1
	mov rax, 60
	xor rdi, rdi
	syscall
