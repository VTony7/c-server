#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define CMD     "ls "

void main(int argc, char *argv[])
{
	char buf[16];

	if (argc < 2) {
		fprintf(stderr, "must an argument.\n");
		exit(1);
	}
	strcpy(buf, CMD);
	strcpy(buf + 3, argv[1]);
	system(buf);

	exit(0);
}
