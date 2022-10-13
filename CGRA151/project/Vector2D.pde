// Represents a vector in 2D space.
class Vector2D {
    private float x, y;

    public float x() { return x; } 
    public float y() { return y; } 

    Vector2D(float x, float y) {
        this.x = x; this.y = y;
    }

    Vector2D(Vector2D v) {
        this.x = v.x; this.y = v.y;
    }
}