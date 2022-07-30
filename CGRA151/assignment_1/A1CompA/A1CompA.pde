size(500, 500);
background(255, 255, 255);
stroke(0, 0, 0);
strokeWeight(1);

int blockSize = 5;
int y = 0;
int x = 0;
int lineSpacing = 25;
int gapMin = 5;
int gapMax = 20;

for (int i = 0; i < height; i += lineSpacing) {
    line(0, i, width, i);
}

while(y < 500) {
    while (x < 500) {
        fill(155, 155, 155);
        rectMode(CORNER);
        rect(x, y, blockSize, lineSpacing);
        x += blockSize + int(random(gapMin, gapMax));
    }
    x = 0;
    y += lineSpacing;
}