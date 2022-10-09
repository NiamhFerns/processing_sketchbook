private class BishopPiece {
    private boolean colour;
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { return new ArrayList<String>(0); }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "Bishop";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(245, 194, colour ? 231 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public BishopPiece(boolean colour) {
        this.colour = colour;
    }
}