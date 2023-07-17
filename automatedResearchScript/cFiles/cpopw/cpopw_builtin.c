#include<stdio.h>

int test(int input) {
    return __builtin_popcount(input);
}

int main() {
    unsigned int input = 30;
    printf("%i", test(input));
}