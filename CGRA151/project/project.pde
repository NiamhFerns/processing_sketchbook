// Primitive Globals
int BOARDSIZE;
int DIMENSION;
int CELLSIZE;
int BOARDOFFSET;
float BOARD_RATIO;

// These are the handlers responsible for all the games textures.
ImageHandler TEXTURES;
CellTextureHandler CELL_TEXTURES_WHITE;
CellTextureHandler CELL_TEXTURES_BLACK;

// These are the games core components.
Chess GAME;
EventHandler EVENTS;

// Handler for any optional components added/removed at runtime.
OptionalComponentsHandler OPTIONAL_FEATURES;

// Time tracking.
long LAST_FRAME_TIME;
long PREVIOUS_MILLIS;

void setup() {
    size(800, 1000);
    frameRate(60);

    // Instantiate globals.
    BOARD_RATIO = 0.9;
    BOARDSIZE = (int)(BOARD_RATIO * width);
    DIMENSION = 8;
    CELLSIZE = BOARDSIZE / DIMENSION;
    BOARDOFFSET = (int)(0.1 * width) / 2;
    
    // Ready assets.
    TEXTURES = new ImageHandler();
    CELL_TEXTURES_WHITE = new WhiteCellTextures();
    CELL_TEXTURES_BLACK = new BlackCellTextures();
    
    // Instantiate core game.
    GAME = new Chess();
    EVENTS = new EventHandler();
    
    // Instantiate optional components.
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
    // Override processings auto exit on escape function.
    if (keyCode == 27) key = 0;
    EVENTS.keyPressed(keyCode);
}

void keyReleased() {
    EVENTS.keyReleased(keyCode);
}