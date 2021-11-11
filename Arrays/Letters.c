#include <stdio.h>
#include <cs50.h>
#include <string.h>
int main(void)
{
    char C = get_char("Please enter a letter");
    int n = (int)C + 15;
    char c = n;
    printf("%c",c);
}