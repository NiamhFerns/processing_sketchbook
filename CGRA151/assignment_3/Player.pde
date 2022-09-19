class Player implements GamePart {
    Vector2D position;
    Vector2D velocity;

    PImage texture;

    float playerWidth;
    float playerHeight;
    
    public float x() { return position.x(); }
    public float y() { return position.y(); }

    // On Creation of Player.
    public Player() {
        playerWidth = 24;
        playerHeight = 52;
        position = new Vector2D(width / 2, height / 2);
        velocity = new Vector2D(0.0f, 0.0f);

        //texture = loadImage();
    }

    // Movement for the player. Set velocity to move x or -x.
    public void moveLeft() {
        velocity = new Vector2D(-MAXVELOCITY, velocity.y());
    }

    public void moveRight() {
        velocity = new Vector2D(MAXVELOCITY, velocity.y());
    }

    // On update of Player.
    public void update() {
        position = position.add(velocity);

        // We aren't using keyReleased in this case so we check each frame if a key is
        // still pressed and reset velocity to zero if not.
        if (!keyPressed) { 
            velocity.zeroX();
        }
    }

    // On draw of Player.
    public void draw() {
        fill(0);
        // Draw player dependant on where camera is.
        rect(position.x() - CAMERA.x(), position.y() - CAMERA.y(), playerWidth, playerHeight);
    }
}