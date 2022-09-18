// Globals
Game GAME;
Camera CAMERA;
float MAXVELOCITY = 5.0f;

void setup() {
    frameRate(60);
    size(2560, 1440);

    CAMERA = new Camera();
    GAME = new Game();
}

void draw() {
    clear();
    background(255);
    // Here we implement a simple observer that updates and then draws each part of the game.
    // DO NOT CALL THIS METHOD ANYWHERE ELSE.
    GAME.update();
}

void keyPressed() {
    GAME.keyPress(keyCode);
}