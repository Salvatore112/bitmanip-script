#include <stdio.h>

signed int test(signed int oneValue, signed int anotherValue) {
    return (oneValue > anotherValue) ? oneValue : anotherValue;
}

int main() {
    printf("%i", test(12, 34));
}