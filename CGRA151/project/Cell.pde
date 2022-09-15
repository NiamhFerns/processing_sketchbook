class Cell implements Globals, GamePart {
    String cellID;
    ChessPiece contains;
    Vector2D position;
    color cellBackground;
    boolean active;

    public boolean isActive() { return active; }
    public String getID() { return cellID; }

    public void update(Chess chess) {
        boolean xBound = mouseX > position.x() + BOARDOFFSET && mouseX < position.x() + CELLSIZE + BOARDOFFSET;
        boolean yBound = mouseY > position.y() + BOARDOFFSET && mouseY < position.y() + CELLSIZE + BOARDOFFSET;
        active = xBound && yBound;
    }

    public void draw() {
        fill(active ? color(150, 150, 0) : cellBackground);
        noStroke();
        rect(position.x(), position.y(), CELLSIZE, CELLSIZE);        
    }

    public String getCode() { return cellID; }

    public Cell(String cellID, Vector2D position, color cellBackground) {
        this.cellID = cellID;
        this.position = position;
        this.cellBackground = cellBackground;
        contains = new ChessPiece();
    }
}