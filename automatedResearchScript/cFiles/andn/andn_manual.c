#include <stdint.h>

int32_t test(int32_t oneValue, int32_t anotherValue) {
    int32_t x = oneValue & ~anotherValue;
    return x;
}
