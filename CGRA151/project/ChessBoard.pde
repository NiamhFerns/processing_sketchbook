class ChessBoard implements GamePart {
    private Cell[][] cells;
    private Cell activeCell;
    private Cell selectedCell;

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

        resetPieces();
    }

    public void update() {
        if (EVENTS.currentState() == EventStates.MENU) return;
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
        // translate(BOARDOFFSET, BOARDOFFSET);
        for (int y = 0; y < cells.length; y++) {
            for (int x = 0; x < cells[y].length; x++) {
                cells[y][x].draw();
            }
        }
        popMatrix();
    }

    public void resetPieces() {
        String[] rows = loadStrings("NewChessGame.txt");
        for (int y = 0; y < rows.length; ++y) {
            String[] pieces = split(rows[y], " ");
            for (int x = 0; x < pieces.length; ++x) {
                cells[y][x].setContents(new ChessPiece(pieces[x], y > 5));
            }
        }
    }

    public void selectPiece() {
        if (activeCell == null || activeCell.isFree()) return;  
        if (EVENTS.getTurn(activeCell.occupiedBy())) return;
        activeCell.setSelected();
        selectedCell = activeCell;
        EVENTS.setState(EventStates.PIECE_SELECTED);
    }
    public void movePiece() {
        // Unselect this cell if it is already selected. I.E: count a move to the same cell as a deselect call.
        if (activeCell == null) return;  
        if (activeCell == selectedCell) { 
            activeCell.setUnselected();
            selectedCell = null;
            EVENTS.setState(EventStates.GAMEPLAY);
            return;
        }
        
        // If this active cell is in the list of possible cells to move to, move it.
        if (activeCell.in(selectedCell.contains.getPossibleMoves())) {
            activeCell.acceptPiece(selectedCell);
            selectedCell.setUnselected();
            selectedCell = null;
            EVENTS.setState(EventStates.GAMEPLAY);
            EVENTS.turnOver();
            return;
        }
        // else play an error audio clip.

    }
}