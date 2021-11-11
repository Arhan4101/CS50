#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    char *s = malloc(4);//earlier set at 3
    s[0] = 'H';
    s[1] = 'I';
    s[2] = '!';
    s[3] = '\0'; //invalid write
    printf("%s\n",s);//invalid read, due to invalid write
    //forgot free initially
    free(s);
}