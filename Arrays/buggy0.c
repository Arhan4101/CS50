#include <stdio.h>
#include <cs50.h>
int main(void)
{   
    //Want to print 10 hashes, but we printed 11, so we can try to print the index itself to see how things are going under the hood
   for (int i = 0;i<=10;i++)
   {
       printf("#\n");
       printf("i is now %i \n",i);
   }

}
//Remove the extra print statement later, after fixing the bug by switching the conditional to i < 10
//Using Debug50 is a better way to see things step by step