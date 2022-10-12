// Primitive Globals
int BOARDSIZE;
int DIMENSION;
int CELLSIZE;
int BOARDOFFSET;
PFont FONT;

Chess GAME;
ImageHandler TEXTURES;
EventHandler EVENTS;
CellTextureHandler CELL_TEXTURES_WHITE;
CellTextureHandler CELL_TEXTURES_BLACK;
OptionalComponentsHandler OPTIONAL_FEATURES;

long LAST_FRAME_TIME;
long PREVIOUS_MILLIS;

void setup() {
    size(800, 1000);
    frameRate(60);
    textAlign(LEFT, TOP);

    // Instantiate globals.
    // BOARDSIZE = (width / 5) * 4;
    BOARDSIZE = (int)(0.9 * (width));
    DIMENSION = 8;
    CELLSIZE = BOARDSIZE / DIMENSION;
    // BOARDOFFSET = (width - BOARDSIZE) / 2;
    BOARDOFFSET = (int)(0.1 * (width)) / 2;

    print(BOARDSIZE + "\n" + DIMENSION + "\n" + CELLSIZE + "\n" + BOARDOFFSET + "\n");
    
    // Create new game.
    TEXTURES = new ImageHandler();
    CELL_TEXTURES_WHITE = new WhiteCellTextures();
    CELL_TEXTURES_BLACK = new BlackCellTextures();
    GAME = new Chess();
    EVENTS = new EventHandler();
    OPTIONAL_FEATURES = new OptionalComponentsHandler();

    LAST_FRAME_TIME = 0;
    PREVIOUS_MILLIS = 0;
}

// This will act as the subject in the observer.
void draw() {
    clear();
    background(255);
    GAME.tick();
    long currentMillis = millis();
    LAST_FRAME_TIME = currentMillis - PREVIOUS_MILLIS;
    PREVIOUS_MILLIS = currentMillis;
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