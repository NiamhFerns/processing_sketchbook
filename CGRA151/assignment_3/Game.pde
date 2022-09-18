class Game {
    Player player;
    ArrayList<GamePart> parts;

    public void keyPress(int code) {
        if (code == UP) print("Up\n");
        if (code == DOWN) print("Down\n");
        if (code == LEFT) player.moveLeft();
        if (code == RIGHT) player.moveRight();
    }

    public Game() {
        player = new Player();
        parts = new ArrayList<GamePart>();
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