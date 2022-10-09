private class PawnPiece {
    private boolean firstMove;
    private boolean colour;
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { 
        return new ArrayList<String>(0); 
    }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "Pawn";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(116, 199, colour ? 236 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public PawnPiece(boolean colour) {
        this.colour = colour;
        this.firstMove = true;
    }
}