private static class CellStatus { 
    enum State {
        ACTIVE,
        INACTIVE,
        SELECTED
    }
}

class Cell implements Globals, GamePart {
    String cellID;
    ChessPiece contains;
    Vector2D position;
    color cellBackground;
    CellStatus.State state;

    public boolean isActive() { return state == CellStatus.State.ACTIVE; }
    public String getID() { return cellID; }

    public void update(Chess chess) {
        boolean xBound = mouseX > position.x() + BOARDOFFSET && mouseX < position.x() + CELLSIZE + BOARDOFFSET;
        boolean yBound = mouseY > position.y() + BOARDOFFSET && mouseY < position.y() + CELLSIZE + BOARDOFFSET;
        state = xBound && yBound && state != CellStatus.State.SELECTED ? CellStatus.State.ACTIVE : CellStatus.State.INACTIVE;
    }

    public void draw() {
        fill(isActive() ? color(150, 150, 0) : cellBackground);
        noStroke();
        rect(position.x(), position.y(), CELLSIZE, CELLSIZE);        
    }

    public String getCode() { return cellID; }

    public Cell(String cellID, Vector2D position, color cellBackground) {
        this.cellID = cellID;
        this.position = position;
        this.cellBackground = cellBackground;
        contains = new ChessPiece();
        state = CellStatus.State.INACTIVE;
    }
}