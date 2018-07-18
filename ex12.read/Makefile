SOURCE=readtest-ex
FORMAT=elf64

all: $(SOURCE)

print.o: print.asm
	nasm -f $(FORMAT) print.asm -o print.o

$(SOURCE).o: $(SOURCE).asm
	nasm -f $(FORMAT) $(SOURCE).asm -o $(SOURCE).o

readtest.o: readtest.c
	$(CC) readtest.c -c -o readtest.o

$(SOURCE): $(SOURCE).o print.o  readtest.o
	$(CC) -o $(SOURCE) $(SOURCE).o print.o readtest.o 
	chmod u+x $(SOURCE)
clean:
	rm -f $(SOURCE) *.o
