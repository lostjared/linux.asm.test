
section .data
newline: db 10
digits: db '0123456789abcdef'

section .text

global print_newline
global print_hex
global print_string
global string_len


print_newline:
	mov rax, 1
	mov rdi, 1
	mov rsi, newline
	mov rdx, 1
	syscall
	ret

print_hex:
	mov rax, rdi
	mov rdi, 1
	mov rdx, 1
	mov rcx, 64
.iterate:
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
	jnz .iterate
	ret

; move string into rdi
string_len:
	xor rax,rax
.loop:
	cmp byte [rdi+rax], 0
	je .end
	inc rax
	jmp .loop
	.end:
	ret

; set string to rsi
; set length to rdx
print_string:
	mov rdi, rsi
	call string_len
	mov rdx,rax
	mov rax, 1
	mov rdi, 1
	syscall
	push rdx
	call print_newline
	pop rdx
	ret
