// Primitive Globals
int BOARDSIZE;
int DIMENSION;
int CELLSIZE;
int BOARDOFFSET;
PFont FONT;

Chess GAME;
ImageHandler TEXTURES;
EventHandler EVENTS; 

void setup() {
    size(1000, 1000);
    frameRate(60);
    FONT = createFont("Arial",16,true);
    textAlign(LEFT, TOP);


    // Instantiate globals.
    // BOARDSIZE = (width / 5) * 4;
    BOARDSIZE = width;
    DIMENSION = 8;
    CELLSIZE = BOARDSIZE / DIMENSION;
    // BOARDOFFSET = (width - BOARDSIZE) / 2;
    BOARDOFFSET = 0;

    print(BOARDSIZE + "\n" + DIMENSION + "\n" + CELLSIZE + "\n" + BOARDOFFSET + "\n");
    
    // Create new game.
    TEXTURES = new ImageHandler();
    GAME = new Chess();
    EVENTS = new EventHandler();

}

// This will act as the subject in the observer.
void draw() {
    clear();
    background(255);
    GAME.tick();
}

// All actions are caught here and then passed through the game to the event handler.
void mouseClicked() {
    EVENTS.mouseClicked();
}

void keyPressed() {
    if (keyCode == 27) key = 0; // Override processings auto exit on escape function.
    EVENTS.keyPressed(keyCode);
}

void keyReleased() {
    EVENTS.keyReleased(keyCode);
}