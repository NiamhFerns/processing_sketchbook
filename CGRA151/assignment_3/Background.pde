class Background implements GamePart {
    private PImage texture;

    private int zIndex;            // The backgrounds 'load order' and z position.
    private float scrollRatio;     // ratio used to determine how much to move the background.
    private Vector2D origin;       // Where the background is from the origin.
    private Vector2D position;     // Where the background has moved to based on camera position.
    private int repeatsFromOrigin; // How far away from origin to draw a repeated background.

    public void update() {
        // Draw our background on the origin shifted by the camera's current 
        // location by a ratio based on distance.
        position = new Vector2D(origin.x() - CAMERA.x() * scrollRatio, origin.y());
        repeatsFromOrigin = (int)abs(position.x()) / texture.width;
    }

    public void draw() {
        image(texture, position.x() + texture.width * repeatsFromOrigin, position.y());
        image(texture, position.x() + texture.width * (repeatsFromOrigin + 1), position.y());
    }

    public Background(String texturePath, int zIndex) {
        // Convert index into a scroll ratio.
        // This removes the need to do an expensive division in the update() method.
        this.zIndex = zIndex;
        scrollRatio = 1.0f / zIndex;
        origin = new Vector2D(0.0f, 0.0f);

        texture = loadImage(texturePath);
        texture.resize(1280, 360);
    }
}