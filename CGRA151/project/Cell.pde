private enum State {
    ACTIVE,
    INACTIVE,
    SELECTED
}

class Cell implements GamePart {
    String cellID;
    ChessPiece contains;
    Vector2D position;
    color cellBackground;
    State state;

    public boolean isActive() { return state == State.ACTIVE; }
    public String getID() { return cellID; }

    public void update() {
        boolean xBound = mouseX > position.x() + BOARDOFFSET && mouseX < position.x() + CELLSIZE + BOARDOFFSET;
        boolean yBound = mouseY > position.y() + BOARDOFFSET && mouseY < position.y() + CELLSIZE + BOARDOFFSET;
        state = xBound && yBound && state != State.SELECTED ? State.ACTIVE : State.INACTIVE;
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
        state = State.INACTIVE;
    }
}