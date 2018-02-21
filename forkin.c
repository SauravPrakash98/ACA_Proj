#include<stdio.h>
#include<unistd.h>

int main(void){
printf("forking processes\n");
fork();
printf("Hello World\n");
return 0;
}

