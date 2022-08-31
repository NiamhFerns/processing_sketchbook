interface Globals {
    // Primitive Globals
    int BOARDSIZE = 800;
    int DIMENSION = 8;
    int CELLSIZE = BOARDSIZE / DIMENSION;
}

class Chess implements Globals {
    ChessBoard board = new ChessBoard();
    ArrayList<GamePart> parts; // ECS ArrayList

    public void tick() {
        for (GamePart part : parts) { part.update(this); }
        for (GamePart part : parts) { part.draw();   }
    }

    public final void drawBoard() {
        // draw cells.
    }

    Chess() {
        // Here we're initialising a very basic ECS that will be based on an observer.
        // Each part of the game will, as it's created, be added to this list and will have the correct methods called every tick.
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

// This will act as the subject in our observer.
void draw() {
    clear();
    background(255);
    game.tick();
}

