all: hello.asm
	nasm -felf64 hello.asm -o hello.o
	ld -o hello_world hello.o
	chmod u+x hello_world
clean:
	rm -f hello_world *.o
