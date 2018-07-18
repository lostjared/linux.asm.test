#include<stdio.h>

extern void print_test(const char *src);

int main(int argc, char **argv) {
	print_test("Hello World\n");
	return 0;
}
