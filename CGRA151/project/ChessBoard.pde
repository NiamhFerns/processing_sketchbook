import java.util.Map;

// This is responsible for handling the current state of the chess board and any movements called on that chessboard.
class ChessBoard implements GamePart {
    // The current state of the cells on the board is stored in a set of fields.
    private HashMap<String, Cell> cellsMap;
    private Cell activeCell;
    private Cell selectedCell;
    private ArrayList<String> validCells;

    // We constsruct a board with the default layout being white on bottom.
    ChessBoard() {
        cellsMap = new HashMap<String, Cell>();
        boolean black = false;
        for (int y = 0; y < DIMENSION; y++) {
            for (int x = 0; x < DIMENSION; x++) {
                // String of 'a' + x position  AND '8' - y position.
                String cellID = str(char(65 + x)) + (8 - y);
                
                // Instantiate a new cell at the correct position then add it to the map. We want to be able to access cells via standard chess notation.
                Cell cell = new Cell(cellID, new Vector2D(CELLSIZE * x + BOARDOFFSET, CELLSIZE * y + BOARDOFFSET), black ? CELL_TEXTURES_BLACK : CELL_TEXTURES_WHITE);
                cellsMap.put(cellID, cell);
                black = !black;
            }
            black = !black;
        }
    }

    // QUERRYS
    // Returns a cell's position based on it's chess notation ID.
    public Vector2D getPositionByCellID(String cellID) { return cellsMap.get(cellID).getPosition(); }

    // Returns a cell based on it's chess notation ID.
    public Cell getCellByID(String cellID) { return cellsMap.get(cellID); }

    // Returns the currently selected cell.
    public Cell getSelected() { return selectedCell; }

    // Returns the next cell in an (X, Y) direction.
    public String nextCell(String currentCell, Pair<Integer, Integer> nextCellDirection) {
        String nextCell = "";
        nextCell = nextCell + char(currentCell.charAt(0) + nextCellDirection.value());
        nextCell = nextCell + char(currentCell.charAt(1) + nextCellDirection.key());
        return nextCell;
    }

    // Checks if a chess notation ID is valid and on the board.
    public boolean checkValidCellID(String cellID) {
        boolean valid = cellID.charAt(0) >= 'A' && cellID.charAt(0) <= 'H' && cellID.charAt(1) >= '1' && cellID.charAt(1) <= '8';
        return valid;
    }

    // Clears the board of any pieces left on it.
    public void clear() {
        for (Cell c : cellsMap.values()) {
            c.setContents(new ChessPiece());
        }
    }

    // Adds a piece to the board.
    public void addPiece(String cellID, ChessPiece piece) {
        cellsMap.get(cellID).setContents(piece);
    }

    // Selects a piece based on the currently active cell.
    public void selectPiece() {
        // If the cell doesn't have anything or isn't one of our pieces, ignore the action.
        if (activeCell == null || activeCell.isFree()) return;  
        if (EVENTS.getTurn(!activeCell.occupiedBy())) return;

        // Select the cell and get any valid moves for the piece in that cell.
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
        // Unset any properties of this cell.
        for (String c : validCells) {
            cellsMap.get(c).setUnhighlighted();
            cellsMap.get(c).unsetDanger();
        }
        // If the cell is a new pawn, we want to disable it's ability to move 2 squares.
        if (selectedCell.getContents().getType().equals("New Pawn")) {
            GAME.killPiece(selectedCell.getContents());
            ChessPiece piece = new ChessPiece(selectedCell.getID(), "p", selectedCell.occupiedBy());
            GAME.addPiece(piece);
            selectedCell.setContents(piece);
        }
        // If there is an enemy on the cell we move into, kill it and take it's position.
        if (activeCell.hasEnemy()) GAME.killPiece(activeCell.getContents());
        activeCell.acceptPiece(selectedCell);

        // Move to the next turn.
        selectedCell.setUnselected();
        selectedCell = null;
        EVENTS.turnOver();
    }

    // Rotates the board such that whatever was on the bottom is now on the top.
    public void rotateBoard() {
        print("Rotating board... \n");
        for (int y = 0; y < DIMENSION; y++) {
            for (int x = 0; x < DIMENSION; x++) {
                // string of a + x  AND 8 - y
                String cellID;
                // Take whatever is in (X, Y) and put it at (X', Y') then repeat for the next cell.
                if(EVENTS.getCurrentTurn()) cellID = str(char(72 - x)) + (1 + y);
                else cellID = str(char(65 + x)) + (8 - y);
                
                // We are adding our cells such that they read from left to right; top to bottom.
                cellsMap.get(cellID).setPosition(new Vector2D(CELLSIZE * x + BOARDOFFSET, CELLSIZE * y + BOARDOFFSET));
            }
        }
    }

    // Update the active cell.
    public void update() {
        if (EVENTS.currentState() == EventStates.MENU) return;
        activeCell = null;
        for (Cell c : cellsMap.values()) {
            c.update();
            if (c.isActive()) activeCell = c;
        }
    }

    // Pass on any draw calls to the relevant cells. Just a simple composite.
    public void draw() {
        for (Cell c : cellsMap.values()) {
            c.draw();
        }
    }
}