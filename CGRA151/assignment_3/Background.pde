class Background implements GamePart {
    PImage texture;
    int zIndex;
    float scrollRatio;
    Vector2D origin;
    Vector2D position;

    public void update() {
        // Draw our background on the origin shifted by the camera's current 
        // location by a ratio based on distance.
        position = new Vector2D(origin.x() - CAMERA.x() * scrollRatio, origin.y());
    }

    public void draw() {
        image(texture, position.x(), position.y());
    }

    public Background(String texturePath, int zIndex) {
        // Convert index into a scroll ratio.
        // This removes the need to do an expensive division in the update() method.
        this.zIndex = zIndex;
        scrollRatio = 1.0f / zIndex * 0.9f;
        origin = new Vector2D(0.0f, 0.0f);

        texture = loadImage(texturePath);
        texture.resize(1280, 360);
    }
}