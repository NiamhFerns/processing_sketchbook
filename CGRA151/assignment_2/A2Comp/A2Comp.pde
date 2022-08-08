color background = color(30, 30, 46);
Ball ball;
Bat bat;

int targetFPS;
float dt, previousTime;
Tile[][] tiles = new Tile[4][8];

private void deltaTime() {
    dt = millis() - previousTime;
    previousTime = millis();
}


void setup() {
    size(640, 480);

    ball = new Ball(new Vector2D(width / 2, 400), 15, new Vector2D(0.1, 0.1));
    bat = new Bat();

    int startX = (width - 8 * (70 + 8)) / 2 + 3;

    for (int y = 0; y < 4; ++y) {
        for (int x = 0; x < 8; ++x) {
            tiles[y][x] = new Tile(new Vector2D(startX + (x * (70 + 8)), 60 + (y * (25 + 8))));
        }
    }
}

private void update() {
    deltaTime();

    // Update Objects.
    ball.update();
    bat.update();
}

void draw(){
    clear();    
    background(background);

    update();

    ball.draw();
    bat.draw();
    for (int y = 0; y < 4; ++y) {
        for (int x = 0; x < 8; ++x) {
            if (tiles[y][x] != null) tiles[y][x].draw();
        }
    }
}