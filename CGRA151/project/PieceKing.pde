private class KingPiece {
    private ArrayList<Pair<Integer, Integer>> movements;
    private boolean colour;
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { return new ArrayList<String>(0); }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "King";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(243, 139, colour ? 168 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }

    public boolean getColour() {
        return colour;
    }

    public KingPiece(boolean colour) {
        this.colour = colour;
        movements = new ArrayList<Pair<Integer, Integer>>();
        movements.add(new Pair(0 ,  1)); // Up
        movements.add(new Pair(-1,  1)); // up Left
        movements.add(new Pair(1 ,  1)); // Up Right
        movements.add(new Pair(0 , -1)); // Down
        movements.add(new Pair(-1, -1)); // Down Left
        movements.add(new Pair(1 , -1)); // Down Right
        movements.add(new Pair(-1,  0)); // Left
        movements.add(new Pair(1 ,  0)); // Right
    }
}