private class RookPiece implements PieceType {
    // This recursively check in cardinal dircetions and return if there's a block or an enemy.
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) {
        ArrayList<String> possibleMoves = new ArrayList<String>();
        if (!GAME.board.checkValidCellID(cellID) || GAME.board.getCellByID(cellID).hasFriendly()) return possibleMoves;
        possibleMoves.add(cellID);
        if (GAME.board.getCellByID(cellID).hasEnemy()) return possibleMoves;
        possibleMoves.addAll(getPossibleMoves(GAME.board.nextCell(cellID, move), move)); 
        return possibleMoves;
    }
    public ArrayList<Pair<Integer, Integer>> getDirections() { 
        ArrayList<Pair<Integer, Integer>> dirs = new ArrayList<Pair<Integer, Integer>>();
        dirs.add(new Pair<Integer, Integer>(0, -1));  // UP
        dirs.add(new Pair<Integer, Integer>(0, 1));   // DOWN
        dirs.add(new Pair<Integer, Integer>(-1, 0));  // LEFT
        dirs.add(new Pair<Integer, Integer>(1, 0));   // RIGHT

        return dirs;
    }
    public String name() {
        return "Rook";
    }
    public PImage getTexture(boolean colour) { 
        return TEXTURES.get(PieceTexture.ROOK, colour);
    }
}