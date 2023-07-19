#include <stdio.h>

unsigned int test(unsigned int oneValue, unsigned int anotherValue) {
    return (oneValue < anotherValue) ? oneValue : anotherValue;
}

int main() {
    printf("%i", test(12, 34));
}