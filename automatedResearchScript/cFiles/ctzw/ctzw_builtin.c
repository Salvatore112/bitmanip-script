#include<stdio.h>

int test(int input){
    return __builtin_ctz(input);
}

int main() {
    int x = 120;
    printf("%i", test(x));
}