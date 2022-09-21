class ChessBoard implements GamePart {
    private Cell[][] cells;
    private Cell activeCell;

    ChessBoard() {
        cells = new Cell[DIMENSION][DIMENSION];
        boolean black = false;
        for (int y = 0; y < cells.length; y++) {
            for (int x = 0; x < cells[y].length; x++) {
                // We are adding our cells such that they read from left to right; top to bottom.
                cells[y][x] = new Cell(str(char(65 + x)) + (8 - y), 
                                       new Vector2D(CELLSIZE * x, CELLSIZE * y), 
                                       color(black ? 0 : 200));
                black = !black;
            }
            black = !black;
        }
    }

    public void update() {
        activeCell = null;
        for (int y = 0; y < cells.length; y++) {
            for (int x = 0; x < cells[y].length; x++) {
                cells[y][x].update();
                if (cells[y][x].isActive()) activeCell = cells[y][x];
            }
        }
    }

    public void draw() {
        // Centre the board.
        pushMatrix();
        translate(BOARDOFFSET, BOARDOFFSET);
        for (int y = 0; y < cells.length; y++) {
            for (int x = 0; x < cells[y].length; x++) {
                cells[y][x].draw();
            }
        }
        popMatrix();
    }

    public void mousePressed() {
        
    }
}