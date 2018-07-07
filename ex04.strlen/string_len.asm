section .data

newline: db 10
digits: db '0123456789abcdef'
output_str: db 'Length of String in Hex: '
string_value: db 'Hello World String', 0

section .text
global _start

print_newline:
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	ret
print_text:
	mov rax, 1
	mov rdi, 1
	mov rsi, output_str
	mov rdx, 25
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

string_len:
	xor rax,rax
	mov rdi, string_value
	mov r13, 0
.loop:
	cmp byte [rdi+rax], 0
	je .end
	inc rax
	jmp .loop
.end:
	ret
_start:
	call print_text
	call string_len
	mov rdi, rax
	call print_hex
	call print_newline
	mov rax, 60
	xor rdi, rdi
	syscall
