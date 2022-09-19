class Camera implements GamePart {
    Vector2D position;
    
    public float x() { return position.x(); }
    public float y() { return position.y(); }

    public void update() {
        // Clamp player in camera on the right.
        if (GAME.playerX() > CAMERA.x() + width - 100) 
            position = new Vector2D(GAME.playerX() - width + 100, position.y());
        
        // Clamp player in camera on the left.
        if (GAME.playerX() < CAMERA.x() + 100) 
            position = new Vector2D(GAME.playerX() - 100, position.y());
    }

    public void draw() {

    }
    
    public Camera() {
        position = new Vector2D(0.0f, 0.0f);
    }
}