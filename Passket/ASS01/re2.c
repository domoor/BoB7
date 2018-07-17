#include <stdio.h>

int foo(int a1, int a2, int a3)
{
	int i = 0;

	i = a1 + a2;
	return (i + a3);
}

int main()
{
	int i = 0;
	int buf[256] = {0};

	foo(1, 2, 10);
	printf("%d", foo(5, 1, 2));
	return 0;
}

