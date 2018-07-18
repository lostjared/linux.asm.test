
#include<stdio.h>

extern void readfile(const char *filename);

void readfile(const char *filename) {
    FILE *fptr = fopen(filename, "r");
    if(!fptr) {
        fprintf(stderr, "Error reading file: %s\n", filename);
    }
    while(!feof(fptr)) {
        char buf[1025];
        int num_read = fread(buf, 1, 1024, fptr);
        buf[num_read] = 0;
        printf("%s", buf);
    }
    printf("\n");
    fclose(fptr);
}
