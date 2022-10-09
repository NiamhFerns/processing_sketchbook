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
                Cell cell = new Cell(cellID, new Vector2D(CELLSIZE * x, CELLSIZE * y), black ? color(191, 107, 75) : color(200));
                cellsMap.put(cellID, cell);
                black = !black;
            }
            black = !black;
        }
    }

    // QUERRYS
    public Vector2D getPositionByCellID(String cellID) { return cellsMap.get(cellID).getPosition(); }

    public void clear() {
        for (Cell c : cellsMap.values()) {
            c.setContents(new ChessPiece());
        }
    }

    public void addPiece(String cellID, ChessPiece piece) {
        cellsMap.get(cellID).setContents(piece);
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

    public void update() {
        if (EVENTS.currentState() == EventStates.MENU) return;
        activeCell = null;
        for (Cell c : cellsMap.values()) {
            c.update();
            if (c.isActive()) activeCell = c;
        }
    }

    public void draw() {
        pushMatrix();
        for (Cell c : cellsMap.values()) {
            c.draw();
        }
        popMatrix();
    }
}