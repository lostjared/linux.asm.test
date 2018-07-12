SOURCE=arraytest
FORMAT=elf64

all: $(SOURCE)

print.o:
	nasm -f $(FORMAT) print.asm -o print.o

$(SOURCE).o: $(SOURCE).asm
	nasm -f $(FORMAT) $(SOURCE).asm -o $(SOURCE).o


$(SOURCE): $(SOURCE).o print.o
	ld -o $(SOURCE) $(SOURCE).o print.o
	chmod u+x $(SOURCE)
clean:
	rm -f $(SOURCE) *.o
