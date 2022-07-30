size(500, 500);
background(155, 155, 155);
stroke(0, 0, 0);
strokeWeight(1);

int max = 60;

for (int i = 0; i < 150; ++i) {
        int px = int(random(0, width)), py = int(random(0, height));
        fill(255, 255, 255);
        triangle(
            int(random(px - max, px + max)), int(random(py - max, py + max)),
            int(random(px - max, px + max)), int(random(py - max, py + max)), 
            int(random(px - max, px + max)), int(random(py - max, py + max))
        );
}