private class PawnPiece implements PieceType {
    private boolean colour;

    // check the cell in front and add it if there is no one there.
    // Take care as this differes heavily from the other pieces.
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) {
        ArrayList<String> possibleMoves = new ArrayList<String>();
        if (!GAME.board.checkValidCellID(cellID)) return possibleMoves;
        
        // If we're moving forward. Do these checked then return
        if(move.value().intValue() == 0) {
            if (GAME.board.getCellByID(cellID).hasEnemy() || GAME.board.getCellByID(cellID).hasFriendly()) return possibleMoves;
            possibleMoves.add(cellID);
            return possibleMoves;
        }

        // Assuming we're not moving forward, do this.
        if (GAME.board.getCellByID(cellID).hasEnemy()) possibleMoves.add(cellID);
        return possibleMoves;
    }

    public ArrayList<Pair<Integer, Integer>> getDirections() { 
        ArrayList<Pair<Integer, Integer>> dirs = new ArrayList<Pair<Integer, Integer>>();
        // Main direction
        dirs.add(new Pair<Integer, Integer>(colour ? -1 : 1, 0));
        // Attack vector directions.
        dirs.add(new Pair<Integer, Integer>(colour ? -1 : 1, 1));
        dirs.add(new Pair<Integer, Integer>(colour ? -1 : 1, -1));
        return dirs;
    }

    public String name() {
        return "Pawn";
    }

    public PImage getTexture(boolean colour) { 
        return TEXTURES.get(PieceTexture.PAWN, colour);
    }

    public PawnPiece(boolean colour) {
        this.colour = colour;
    }
}

private class NewPawnPiece implements PieceType {
    private boolean colour;
    // This functions the same as a normal pawn.
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) {
        ArrayList<String> possibleMoves = new ArrayList<String>();
        if (!GAME.board.checkValidCellID(cellID)) return possibleMoves;
        
        // If we're moving forward. Do these checked then return
        if(move.value().intValue() == 0) {
            if (GAME.board.getCellByID(cellID).hasEnemy() || GAME.board.getCellByID(cellID).hasFriendly()) return possibleMoves;
            possibleMoves.add(cellID);
            return possibleMoves;
        }

        // Assuming we're not moving forward, do this.
        if (GAME.board.getCellByID(cellID).hasEnemy()) possibleMoves.add(cellID);
        return possibleMoves;
    }

    public ArrayList<Pair<Integer, Integer>> getDirections() { 
        ArrayList<Pair<Integer, Integer>> dirs = new ArrayList<Pair<Integer, Integer>>();
        // Here we simply add an additional direction of a forward move if the cell is new.
        dirs.add(new Pair<Integer, Integer>(colour ? -1 : 1, 0));
        dirs.add(new Pair<Integer, Integer>(colour ? -2 : 2, 0));
        dirs.add(new Pair<Integer, Integer>(colour ? -1 : 1, 1));
        dirs.add(new Pair<Integer, Integer>(colour ? -1 : 1, -1));
        return dirs;
    }

    public String name() {
        return "New Pawn";
    }

    public PImage getTexture(boolean colour) { 
        return TEXTURES.get(PieceTexture.PAWN, colour);
    }

    public NewPawnPiece(boolean colour) {
        this.colour = colour;
    }
}