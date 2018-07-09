
%define EXIT_CODE 60

%macro print 1

%ifid %1
	mov rsi, %1
	call print_string
%else
%ifnum %1
	mov rdi, %1
	call print_hex
%else
	%error "Not supported yet..."
%endif
%endif
%endmacro


section .data

hello: db 'Test 1 2 3',10, 0
value: dq 0xFF

section .text

global _start
extern print_string
extern print_hex
extern print_newline

_start:

	print 0xFF
	call print_newline
	print hello
	mov rax, EXIT_CODE
	xor rdi, rdi
	syscall
