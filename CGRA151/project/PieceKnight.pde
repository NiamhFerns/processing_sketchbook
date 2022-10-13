private class KnightPiece implements PieceType {
    // Check each of 8 possible spots and add them if we can move there. No recursion needed.
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) {
        ArrayList<String> possibleMoves = new ArrayList<String>();
        if (!GAME.board.checkValidCellID(cellID) || GAME.board.getCellByID(cellID).hasFriendly()) return possibleMoves;
        possibleMoves.add(cellID);
        return possibleMoves;
    }
    public ArrayList<Pair<Integer, Integer>> getDirections() { 
        ArrayList<Pair<Integer, Integer>> dirs = new ArrayList<Pair<Integer, Integer>>();
        dirs.add(new Pair<Integer, Integer>(-2, -1));  // N
        dirs.add(new Pair<Integer, Integer>(-2, 1));   // S
        dirs.add(new Pair<Integer, Integer>(-1, -2));  // E
        dirs.add(new Pair<Integer, Integer>(1, -2));   // W
        dirs.add(new Pair<Integer, Integer>(2, -1));  // NW
        dirs.add(new Pair<Integer, Integer>(2, 1));  // NE
        dirs.add(new Pair<Integer, Integer>(-1, 2));   // SW
        dirs.add(new Pair<Integer, Integer>(1, 2));   // SE

        return dirs;
    }
    public String name() {
        return "Knight";
    }
    public PImage getTexture(boolean colour) { 
        return TEXTURES.get(PieceTexture.KNIGHT, colour);
    }
}
