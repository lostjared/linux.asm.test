SOURCE=calltest
FORMAT=elf64

all: $(SOURCE)


$(SOURCE).o: $(SOURCE).asm
	nasm -f $(FORMAT) $(SOURCE).asm -o $(SOURCE).o

callcode.o: callcode.c
	$(CC) callcode.c -c -o callcode.o

$(SOURCE): $(SOURCE).o callcode.o
	$(CC) -o $(SOURCE) $(SOURCE).o callcode.o 
	chmod u+x $(SOURCE)
clean:
	rm -f $(SOURCE) *.o
