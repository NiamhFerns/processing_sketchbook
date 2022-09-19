class Game {
    Player player;
    ArrayList<GamePart> parts;

    public float playerX() { return player.x(); } 
    public float playerY() { return player.y(); } 

    public void keyPress(int code) {
        if (code == UP) print("Up\n");
        if (code == DOWN) print("Down\n");
        if (code == LEFT) player.moveLeft();
        if (code == RIGHT) player.moveRight();
    }

    public Game() {
        player = new Player();
        parts = new ArrayList<GamePart>();
        parts.add(new Background("background_layer_1_sm.png", 3));
        parts.add(new Background("background_layer_2_sm.png", 2));
        parts.add(new Background("background_layer_3_sm.png", 1));
        parts.add(CAMERA);
        parts.add(player);
    }

    public void update() {
        for(GamePart part : parts) {
            part.update();
            part.draw();
        }
    }
}