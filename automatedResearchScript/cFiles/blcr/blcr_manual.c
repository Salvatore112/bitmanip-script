#include <stdint.h>

int32_t test(int32_t rs1Value, int index) {
    index = index & (32 - 1);
    int32_t rd = rs1Value & ~(1 << index);
    return rd;
}