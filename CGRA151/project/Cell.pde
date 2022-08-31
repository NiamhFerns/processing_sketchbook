class Cell implements GamePart {
    String cellID;
    ChessPiece contains;

    public void update() {

    }
    public void draw() {

    }

    public String getCode() { return cellID; }

    public Cell(String cellID) {
        this.cellID = cellID;
        contains = new EmptyChessPiece();
    }
}