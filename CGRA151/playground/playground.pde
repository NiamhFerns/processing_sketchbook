size(500, 500);
for (int i = 0; i < 10; i++) {
    scale(1 + i, 1);
    line(i * 25, 0, i * 25, height);
}