class Vector2D {
    float x, y;

    public float x() { return x; }
    public float y() { return y; }

    // Add 2 vectors together.
    public Vector2D add(Vector2D v) { return new Vector2D(x + v.x(), y + v.y()); }
    public Vector2D add(float x, float y) { return new Vector2D(this.x + x, this.y + y); }
    
    // reduce a vector to zero by a certain rate each time this is called.
    public Vector2D dropToZero(float rate) { 
        return new Vector2D(
            this.x() * rate,
            this.y() * rate
        );
    }

    // Get zero vectors for (0, 0), (0, y), or (x, 0).
    public void zero() { this.x = 0.0f; this.y = 0.0f; }
    public void zeroX() { this.x = 0.0f; }
    public void zeroY() { this.y = 0.0f; }

    public Vector2D(float x, float y) {
        this.x = x;
        this.y = y;
    }

    public Vector2D(Vector2D v) {
        this.x = v.x();
        this.y = v.y();
    }
}