
global main
extern readfile
extern exit

section .data
filename: db 'print.asm', 0

section .text

main:
	lea rdi, [rel filename]
	call readfile
	mov rdi, 0
	call exit
	ret

