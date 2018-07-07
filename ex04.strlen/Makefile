SOURCE=string_len

all: $(SOURCE).asm
	nasm -felf64 $(SOURCE).asm -o $(SOURCE).o
	ld -o $(SOURCE) $(SOURCE).o
	chmod u+x $(SOURCE)
clean:
	rm -f $(SOURCE) *.o
