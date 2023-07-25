#include <stdint.h>

uint64_t test1(uint64_t rs1, uint64_t rs2) {
    rs2 += (rs1 << 2);
    return rs2;
}

uint64_t test2(uint64_t rs1, uint64_t rs2) {
    return rs2 + (rs1 << 2);
}

uint64_t test3(uint64_t rs1, uint64_t rs2) {
    return (rs1 << 2) + rs2;
}

uint64_t test4(uint64_t rs1, uint64_t rs2) {
    uint64_t rs3 = rs2 + (rs1 << 2);
    return rs3;
}

uint64_t test5(uint64_t rs1, uint64_t rs2) {
    uint64_t rs3 = (rs1 << 2) + rs2;
    return rs3;
}
