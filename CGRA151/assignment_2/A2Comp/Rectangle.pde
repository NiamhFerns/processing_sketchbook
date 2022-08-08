class Rectangle {
    int w, h;
    Vector2D position;
    color currentColor;

    int getWidth() { return w; }
    int getHeight() { return h; }

    int getX() { return (int)position.x; }
    int getY() { return (int)position.y; }

    public Vector2D getPos() {
        // No idea how to return an immutable reference to this object.
        return new Vector2D(position);
    }

    public void move(Vector2D velocity) {
        this.position.add(velocity, dt);
    }

    public void setPos(Vector2D position) {
        this.position.x = position.x;
        this.position.y = position.y;
    }

    public void setPos(float x, float y) {
        this.position.x = x;
        this.position.y = y;
    }

    public Rectangle(int w, int h, Vector2D position) {
        this.position = position;
        this.w = w;
        this.h = h;
        currentColor = color(0, 0, 0);
    }

    public void draw() {
        color restore = g.fillColor;
        fill(currentColor);
        rect(position.x, position.y, w, h);
        fill(restore);
    }
}