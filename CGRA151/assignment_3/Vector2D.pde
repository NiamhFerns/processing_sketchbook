class Vector2D {
    float x, y;

    public float x() { return x; }
    public float y() { return y; }

    public Vector2D add(Vector2D v) { return new Vector2D(x + v.x(), y + v.y()); }
    public Vector2D add(float x, float y) { return new Vector2D(this.x + x, this.y + y); }
    public Vector2D dropToZero(float rate) { 
        return new Vector2D(
            this.x() * rate,
            this.y() * rate
        );
    }

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