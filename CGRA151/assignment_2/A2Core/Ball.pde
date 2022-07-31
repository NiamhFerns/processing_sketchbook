class Ball {
    public Vector2D position;
    public float radius;
    private color currentColor;

    public void draw() {
        color restore = g.fillColor;
        fill(currentColor);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
        fill(restore);
    }

    public Vector2D getPos() {
        // No idea how to return an immutable reference to this object.
        return position;
    }

    public float nextX(Vector2D v) {
        return position.x + v.x;
    }

    public float nextY(Vector2D v) {
        return position.y + v.y;
    }

    public void move(Vector2D velocity) {
        this.position.add(velocity);
    }

    public Ball() {
        // Code Smell but it's fine this.
        position = new Vector2D(0, 0);
        radius = 1.0;
        currentColor = color(0, 0, 0);
    }

    public Ball(Vector2D position, float radius) {
        currentColor = color(0, 0, 0);
        this.radius = radius;
        this.position = position;
    }
}