#include <stdio.h>
#include <stdlib.h>

int main(int argc, char **argv)
{
        int a=0, b=0;

        if(argc != 2) exit(0);

        for(a=1; a <= 9; a++)
                for(b=1; b <= 9; b++)
                        printf("%d\n", a * b);
        return 0;
}

