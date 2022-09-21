// Primitive Globals
int BOARDSIZE;
int DIMENSION;
int CELLSIZE;
int BOARDOFFSET;

Chess GAME;
EventHandler EVENTS; 

void setup() {
    size(1000, 1000);
    frameRate(60);

    // Instantiate globals.
    BOARDSIZE = (width / 5) * 4;
    DIMENSION = 8;
    CELLSIZE = BOARDSIZE / DIMENSION;
    BOARDOFFSET = (width - BOARDSIZE) / 2;

    print(BOARDSIZE + "\n" + DIMENSION + "\n" + CELLSIZE + "\n" + BOARDOFFSET + "\n");
    
    // Create new game.
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