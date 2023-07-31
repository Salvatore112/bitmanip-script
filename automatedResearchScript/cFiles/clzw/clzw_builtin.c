#include<stdint.h>

int test(int32_t a) {
    return __builtin_clz(a);
}
