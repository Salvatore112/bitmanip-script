#include<stdio.h>

uint32_t test(uint32_t x) {
    return __builtin_bswap32(x);
}

int main() {
    printf("%d", test(0xaabb));
}