#include <cs50.h>
#include <stdio.h>
#include <string.h>
//Even if you input the exact same strings, you will get an output that says they are different, because we are actually only checking the addresses of the first char

int main(void)
{
    char *s = get_string("s: ");
    char *t = get_string("t: ");

    if (strcmp(s, t) == 0)
    {
        printf("Same\n");
    }
    else
    {
        printf("Different\n");
    }
}