import java.util.Map;

class ChessBoard implements GamePart {
    private HashMap<String, Cell> cellsMap;
    private Cell activeCell;
    private Cell selectedCell;

    ChessBoard() {
        cellsMap = new HashMap<String, Cell>();
        boolean black = false;
        for (int y = 0; y < DIMENSION; y++) {
            for (int x = 0; x < DIMENSION; x++) {
                // string of a + x  AND 8 - y
                String cellID = str(char(65 + x)) + (8 - y);
                
                // We are adding our cells such that they read from left to right; top to bottom.
                Cell cell = new Cell(cellID, new Vector2D(CELLSIZE * x, CELLSIZE * y), color(black ? 0 : 200));
                cellsMap.put(cellID, cell);
                print("Stored ID: " + cellsMap.get(cellID).getID() + " Actual ID: " + cellID + "\n");
                black = !black;
            }
            black = !black;
        }

        resetPieces();
    }

    public void update() {
        if (EVENTS.currentState() == EventStates.MENU) return;
        activeCell = null;
        for (Cell c : cellsMap.values()) {
            c.update();
            if (c.isActive()) activeCell = c;
        }
    }

    public void draw() {
        // Centre the board.
        pushMatrix();
        // translate(BOARDOFFSET, BOARDOFFSET);
        for (Cell c : cellsMap.values()) {
            c.draw();
        }
        popMatrix();
    }

    public void resetPieces() {
        // Empty the pieces.
        for (Cell c : cellsMap.values()) {
            c.setContents(new ChessPiece());
        }

        // Load the default board.
        String[] chessPieces = loadStrings("PieceTesting.txt");
        for (String piece : chessPieces) {
            String[] pieceInfo = piece.split(",");
            cellsMap.get(pieceInfo[0]).setContents(new ChessPiece(pieceInfo[0], pieceInfo[1], pieceInfo[2].equals("b")));
        }
    }

    public void selectPiece() {
        if (activeCell == null || activeCell.isFree()) return;  
        if (EVENTS.getTurn(!activeCell.occupiedBy())) return;
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