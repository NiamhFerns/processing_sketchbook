class Game {
    // Constants
    public static final int BOARDWIDTH  = 8;
    public static final int BOARDHEIGHT = 8;

    Cell[][] cells;
    ArrayList<GamePart> parts; // ECS ArrayList

    public void tick() {
        for (GamePart part : parts) { part.update(); }
        for (GamePart part : parts) { part.draw();   }
    }

    public final void drawBoard() {
        // draw cells.
    }

    Game() {
        // Here we're initialising a very basic ECS that will be based on an observer.
        // Each part of the game will, as it's created, be added to this list and will have the correct methods called every tick.
        parts = new ArrayList<GamePart>();
        cells = new Cell[BOARDHEIGHT][BOARDWIDTH];
        for (int y = 0; y < BOARDHEIGHT; y++) {
            for (int x = 0; x < BOARDWIDTH; x++) {
                // We are adding our cells such that they read from left to right; top to bottom.
                cells[y][x] = new Cell(str(char(65 + x)) + (8 - y));
                parts.add(cells[y][x]);
            }
        }
    }
}

Game gm;

void setup() {
    size(640, 480);
    frameRate(60);
    gm = new Game();
}

// This will act as the subject in our observer.
void draw() {
    background(255); 
    gm.tick();
}

