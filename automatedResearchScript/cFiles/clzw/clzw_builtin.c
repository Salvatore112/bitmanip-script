#include<stdio.h>
#include<stdint.h>

int test(int32_t a) {
    return __builtin_clz(a);
}

int main() {
    volatile int32_t x = 0b010;
    printf("%d \n", test(x));
}