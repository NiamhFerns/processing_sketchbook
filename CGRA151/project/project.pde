interface Globals {
    // Primitive Globals
    int BOARDSIZE = 800;
    int DIMENSION = 8;
    int CELLSIZE = BOARDSIZE / DIMENSION;
    int BOARDOFFSET = 100;
}

class Chess implements Globals {
    private ChessBoard board;
    private ArrayList<GamePart> parts; // ECS ArrayList
    private EventHandler eventHandler;

    public void tick() {
        for (GamePart part : parts) { part.update(this); }
        for (GamePart part : parts) { part.draw();   }
    }

    public final void drawBoard() {
        // draw cells.
    }

    public void mouseClicked() {
        eventHandler.mouseClicked();
    }

    Chess() {
        // Here we're initialising a very basic ECS that will be based on an observer.
        // Each part of the game will, as it's created, be added to this list and will have the correct methods called every tick.
        eventHandler = new EventHandler();
        board = new ChessBoard();
        parts = new ArrayList<GamePart>();
        parts.add(board);
    }
}

Chess game;

void setup() {
    size(1000, 1000);
    frameRate(60);
    game = new Chess();
}

// This will act as the subject in the observer.
void draw() {
    clear();
    background(255);
    game.tick();
}

// All actions are caught here and then passed through the game to the event handler.
void mouseClicked() {
    game.mouseClicked();
}