class Cell implements GamePart {
    String cellID;
    ChessPiece contains;
    Vector2D position;
    color cellBackground;
    boolean selected = false;
    boolean active   = false;

    public boolean isActive() { return active; }
    public boolean isSelected() { return selected; }
    public String getID() { return cellID; }

    public void update() {
        boolean xBound = mouseX > position.x() + BOARDOFFSET && mouseX < position.x() + CELLSIZE + BOARDOFFSET;
        boolean yBound = mouseY > position.y() + BOARDOFFSET && mouseY < position.y() + CELLSIZE + BOARDOFFSET;
        active = xBound && yBound;
    }

    public void draw() {
        fill(isSelected() ? color(150, 0, 0) : isActive() ? color(150, 150, 0) : cellBackground);
        noStroke();
        rect(position.x(), position.y(), CELLSIZE, CELLSIZE);
    }
    
    public void setContents(ChessPiece piece) {
        contains = piece;
    }

    public void setSelected() {
        selected = true;
    }
    
    public void setUnselected() {
        selected = false;
    }

    public boolean isFree() {
        return contains.isEmpty();
    }

    public boolean in(ArrayList<Cell> cells) {
        return true;
    }

    public void printContents() {
        if (!isFree()) print("[VALUE] CELL CONTENTS: [" + cellID + "] contains [" + contains.getType() + "]\n");
    }

    public String getCode() { return cellID; }

    public Cell(String cellID, Vector2D position, color cellBackground) {
        this.cellID = cellID;
        this.position = position;
        this.cellBackground = cellBackground;
        contains = new ChessPiece();
        active = false;
    }
}