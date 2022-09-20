class Game {
    private Player player;
    
    // Observers to update every tick.
    private ArrayList<GamePart> parts;

    public float playerX() { return player.x(); }

    public float playerY() { return player.y(); } 

    public void keyPress(int code) {
        if (code == LEFT) player.moveLeft();
        if (code == RIGHT) player.moveRight();
        if (code == ' ') player.jump();
    }

    public Game() {
        player = new Player();
        parts = new ArrayList<GamePart>();

        // Lower z == closer to screen.
        parts.add(new Background("background_layer_1_sm.png", 3));
        parts.add(new Background("background_layer_2_sm.png", 2));
        parts.add(new Background("background_layer_3_sm.png", 1));
        parts.add(CAMERA);
        parts.add(player);
    }

    // On each tick, update our game entities.
    public void update() {
        for(GamePart part : parts) {
            part.update();
            part.draw();
        }
    }
}