#include <stdio.h>
#include <cs50.h>
#include <string.h>
#include <ctype.h>

int main(void)
{
    string plain_text = get_string("Please enter text to be encrypted : "); //Prompts user to provide plaintext
    int key = get_int("Please enter key : "); //Prompts user to provide the key
    for (int i = 0, n = strlen(plain_text); i < n; i++) //Reads plaintext letter by letter
    {
        if (islower(plain_text[i]))
        {    
            printf("%c", (plain_text[i] - 'a'  + key) % 26 + 'a');
        }
        else if (isupper(plain_text[i]))
        {
            printf("%c", (plain_text[i] - 'A' + key) % 26 + 'A');
        }
        else //We don't wish to change anything in the message that is not letters
        {
            printf("%c", plain_text[i]);
        }
    }
}