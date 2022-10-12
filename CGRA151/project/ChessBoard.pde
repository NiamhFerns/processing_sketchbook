import java.util.Map;

class ChessBoard implements GamePart {
    private HashMap<String, Cell> cellsMap;
    private Cell activeCell;
    private Cell selectedCell;
    private ArrayList<String> validCells;

    ChessBoard() {
        cellsMap = new HashMap<String, Cell>();
        boolean black = false;
        for (int y = 0; y < DIMENSION; y++) {
            for (int x = 0; x < DIMENSION; x++) {
                // string of a + x  AND 8 - y
                String cellID = str(char(65 + x)) + (8 - y);
                
                // We are adding our cells such that they read from left to right; top to bottom.
                Cell cell = new Cell(cellID, new Vector2D(CELLSIZE * x + BOARDOFFSET, CELLSIZE * y + BOARDOFFSET), black ? CELL_TEXTURES_BLACK : CELL_TEXTURES_WHITE);
                cellsMap.put(cellID, cell);
                black = !black;
            }
            black = !black;
        }
    }

    // QUERRYS
    public Vector2D getPositionByCellID(String cellID) { return cellsMap.get(cellID).getPosition(); }

    public Cell getCellByID(String cellID) { return cellsMap.get(cellID); }

    public Cell getSelected() { return selectedCell; }

    public String nextCell(String currentCell, Pair<Integer, Integer> nextCellDirection) {
        String nextCell = "";
        nextCell = nextCell + char(currentCell.charAt(0) + nextCellDirection.value());
        nextCell = nextCell + char(currentCell.charAt(1) + nextCellDirection.key());
        return nextCell;
    }

    public boolean checkValidCellID(String cellID) {
        boolean valid = cellID.charAt(0) >= 'A' && cellID.charAt(0) <= 'H' && cellID.charAt(1) >= '1' && cellID.charAt(1) <= '8';
        return valid;
    }

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
        validCells = selectedCell.contains.getPossibleMoves();
        for (String c : validCells) {
            cellsMap.get(c).setHighlighted();
            if(cellsMap.get(c).hasEnemy()) cellsMap.get(c).setDanger();
        }
        EVENTS.setState(EventStates.PIECE_SELECTED);
    }

    public void movePiece() {
        // Unselect this cell if it is already selected. I.E: count a move to the same cell as a deselect call.
        if (activeCell == null) return;  
        if (activeCell == selectedCell) { 
            activeCell.setUnselected();
            selectedCell = null;
            EVENTS.setState(EventStates.GAMEPLAY);
            for (String c : validCells) {
                cellsMap.get(c).setUnhighlighted();
                cellsMap.get(c).unsetDanger();
            }
            return;
        }
        
        // If this active cell is in the list of possible cells to move to, move it.
        if (!activeCell.in(validCells)) return;
        EVENTS.setState(EventStates.GAMEPLAY);
        for (String c : validCells) {
            cellsMap.get(c).setUnhighlighted();
            cellsMap.get(c).unsetDanger();
        }
        if (selectedCell.getContents().getType().equals("New Pawn")) {
            GAME.killPiece(selectedCell.getContents());
            ChessPiece piece = new ChessPiece(selectedCell.getID(), "p", selectedCell.occupiedBy());
            GAME.addPiece(piece);
            selectedCell.setContents(piece);
        }
        if (activeCell.hasEnemy()) GAME.killPiece(activeCell.getContents());
        activeCell.acceptPiece(selectedCell);
        selectedCell.setUnselected();
        selectedCell = null;
        EVENTS.turnOver();
    }

    public void rotateBoard() {
        print("Rotating board... \n");
        for (int y = 0; y < DIMENSION; y++) {
            for (int x = 0; x < DIMENSION; x++) {
                // string of a + x  AND 8 - y
                String cellID;
                if(EVENTS.getCurrentTurn()) cellID = str(char(72 - x)) + (1 + y);
                else cellID = str(char(65 + x)) + (8 - y);
                
                // We are adding our cells such that they read from left to right; top to bottom.
                cellsMap.get(cellID).setPosition(new Vector2D(CELLSIZE * x + BOARDOFFSET, CELLSIZE * y + BOARDOFFSET));
            }
        }
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
        for (Cell c : cellsMap.values()) {
            c.draw();
        }
    }
}