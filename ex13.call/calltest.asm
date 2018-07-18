
section .text

global print_test
extern puts

; rdi - null terminated string
print_test:
	call puts
	ret

