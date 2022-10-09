private class RookPiece implements PieceType {

    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { 
        return new ArrayList<String>(0); 
    }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "Rook";
    }
    public PImage getTexture(boolean colour) { 
        return TEXTURES.get(PieceTexture.ROOK, colour);
    }
    public RookPiece() {
    }
}