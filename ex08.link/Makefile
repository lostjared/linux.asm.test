SOURCE=testprog
FORMAT=elf64

all: testprog

test.o: test.c
	$(CC) -c test.c 

$(SOURCE).o: $(SOURCE).asm
	nasm -f $(FORMAT) $(SOURCE).asm -o $(SOURCE).o


$(SOURCE):  $(SOURCE).o test.o
	$(CC) -o $(SOURCE) $(SOURCE).o test.o
	chmod u+x $(SOURCE)
clean:
	rm -f $(SOURCE) *.o
