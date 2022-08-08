class Vector2D {
    float x;
    float y;

    // Vector manipulation methods.
    void invert() {
        x = -x;
        y = -y;
    }
    void invert(Vector2D v) {
        x = v.x >= 0 ? -x : x; 
        y = v.y >= 0 ? -y : y; 
    }
    void invertX() { x = -x; }
    void invertY() { y = -y; }

    // Math methods.
    void add(Vector2D v) {
        x += v.x;
        y += v.y;
    }
    void add(Vector2D v, double scalar) {
        x += v.x * scalar;
        y += v.y * scalar;
    }
    float norm() {
        return sqrt(x * x + y * y);
    }

    // Constructors
    Vector2D() {
        x = 0;
        y = 0;
    }
    Vector2D(float x, float y) {
        this.x = x;
        this.y = y;
    }
    Vector2D(Vector2D v) {
        this.x = v.x;
        this.y = v.y;
    }
}