class Cell implements Globals, GamePart {
    String cellID;
    ChessPiece contains;
    Vector2D position;
    color cellBackground;

    public void update(Chess chess) {

    }
    public void draw() {
        fill(cellBackground);
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