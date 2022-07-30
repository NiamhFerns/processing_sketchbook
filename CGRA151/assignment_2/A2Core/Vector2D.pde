class Vector2D {
    float x;
    float y;

    void invert() {
        x = -x;
        y = -y;
    }

    void invertX() {
        x = -x;
    }

    void invertY() {
        y = -y;
    }

    void reflect() {
        float t = x;
        x = -y;
        y = -t;
    }

    void add(Vector2D v) {
        x += v.x;
        y += v.y;
    }

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