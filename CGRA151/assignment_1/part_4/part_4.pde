// Vars
int r;

void setup() {
    size(512, 512);
    r = 100;
}

void draw() {
    clear();
    background(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(1);

    // Decide fill colour.
    fill(0, 0, 255);
    if (mousePressed) fill(255, 0, 0);

    // Draw Circle
    ellipse(mouseX, mouseY, r, r);
}
