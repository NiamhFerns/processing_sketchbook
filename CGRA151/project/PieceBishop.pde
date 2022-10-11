private class BishopPiece implements PieceType {
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
        dirs.add(new Pair<Integer, Integer>(-1, -1));  // NW
        dirs.add(new Pair<Integer, Integer>(-1, 1));  // NE
        dirs.add(new Pair<Integer, Integer>(1, -1));   // SW
        dirs.add(new Pair<Integer, Integer>(1, 1));   // SE

        return dirs;
    }
    public String name() {
        return "Bishop";
    }
    public PImage getTexture(boolean colour) { 
        return TEXTURES.get(PieceTexture.BISHOP, colour);
    }
}
