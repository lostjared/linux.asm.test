SOURCE=mac

all: mac

print.o: print.asm
	nasm -f elf64 print.asm -o print.o

$(SOURCE).o: $(SOURCE).asm
	nasm -f elf64 $(SOURCE).asm -o $(SOURCE).o


$(SOURCE):  print.o $(SOURCE).o
	ld -o $(SOURCE) $(SOURCE).o print.o
	chmod u+x $(SOURCE)
clean:
	rm -f $(SOURCE) *.o
