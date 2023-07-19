#include<stdio.h>

int test1(int rs1, int rs2) {
    rs2 += (rs1 << 2);
    return rs2;
}

int test2(int rs1, int rs2) {
    return rs2 + (rs1 << 2);
}

int test3(int rs1, int rs2) {
    return (rs1 << 2) + rs2;
}

int test4(int rs1, int rs2) {
    int rs3 = rs2 + (rs1 << 2);
    return rs3;
}

int test5(int rs1, int rs2) {
    int rs3 = (rs1 << 2) + rs2;
    return rs3;
}
