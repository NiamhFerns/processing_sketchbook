class Bat {
    int w, h;
    Vector2D position;
    color currentColor;

    public Bat(int w, int h, Vector2D position) {
        this.position = position;
        this.w = w;
        this.h = h;
        currentColor = color(0, 0, 0);
    }

    public void move() {
        position.x = mouseX - w / 2;
        position.y = mouseY - h / 2;
    }

    public void draw() {
        color restore = g.fillColor;
        fill(currentColor);
        rect(position.x, position.y, w, h);
        fill(restore);
    }
}