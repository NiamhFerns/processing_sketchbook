class Tile extends Rectangle {
    int lives = 3;
    public void update() {
        lives--;
        if (lives == 2) {
            currentColor = color(250, 179, 135);
        }
        if (lives == 1) {
            currentColor = color(243, 139, 168);
        }
    }

    public Tile(Vector2D v) {
        super(70, 20, v);
        currentColor = color(166, 227, 161);
    }
}