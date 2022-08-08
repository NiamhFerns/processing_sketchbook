class Circle {
    public Vector2D position;
    public float radius;
    public color currentColor;

    public void draw() {
        color restore = g.fillColor;
        fill(currentColor);
        ellipse(position.x, position.y, 2 * radius, 2 * radius);
        fill(restore);
    }

    public float getRadius() { return radius; }

    public Vector2D getPos() {
        // No idea how to return an immutable reference to this object.
        return new Vector2D(position);
    }

    public void move(Vector2D velocity) {
        this.position.add(velocity, dt);
    }

    public Circle() {
        // Code Smell but it's fine this.
        position = new Vector2D(0, 0);
        radius = 1.0;
        currentColor = color(0, 0, 0);
    }

    public Circle(Vector2D position, float radius) {
        currentColor = color(0, 0, 0);
        this.radius = radius;
        this.position = position;
    }
}