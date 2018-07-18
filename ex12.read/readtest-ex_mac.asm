
global _main
extern _readfile

section .data
filename: db 'print.asm', 0

section .text

_main:
	push rbx
	lea rdi, [rel filename]
	call _readfile
	pop rbx
	ret

