int cpopw_manual(int input) {
    int count = 0;
    if ((input & 1) != 0) {
        count++;
    }
    for (int i = 1; i < 32; i++) {
        if ((input & (1 << (i - 1))) != 0) {
            count++;
        }
    }
    return count;
}
