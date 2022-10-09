// Chess Piece States
interface PieceType {
    ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move);
    ArrayList<Pair<Integer, Integer>> getDirections();
    String name();
    void drawSprite();
    boolean getColour(); // false == white. THink of this as a latch.
}

public class ChessPiece implements GamePart {
    private PieceType type;
    private ArrayList<String> possibleMoves;
    private boolean recheckMoves = true;
    private String location;

    public void update() { 
        // if(recheckMoves) possibleMoves = type.getPossibleMoves();
    }
    public void draw()   {
        type.drawSprite();
    }

    public String getType() { return type.name(); }
    public boolean getColour() { return type.getColour(); }

    public boolean isEmpty() { return type.name().equals("EMPTY"); }

    public ArrayList<String> getPossibleMoves() {
        ArrayList<Pair<Integer, Integer>> directions = type.getDirections();
        ArrayList<String> possibleMoves = new ArrayList<String>();
        for (Pair<Integer, Integer> d : directions) { 
            possibleMoves.addAll(type.getPossibleMoves(location, d));
        }
        return possibleMoves;
    }
    
    ChessPiece() {
        type = new Empty();
        possibleMoves = new ArrayList<String>();
    }

    ChessPiece(String location, String piece, boolean colour) {
        // print((piece != "#" ? piece : "empty") + "\n");
        switch (piece) {
            // case "k":
            //     type = new KingPiece(colour);
            //     break;
            // case "q":
            //     type = new QueenPiece(colour);
            //     break;
            // case "b":
            //     type = new BishopPiece(colour);
            //     break;
            // case "h":
            //     type = new KnightPiece(colour);
            //     break;
            case "r":
                type = new RookPiece(colour);
                break;
            // case "p":
            //     type = new PawnPiece(colour);
            //     break;
            default:
                type = new Empty();
        }
        possibleMoves = new ArrayList<String>();
    }
}

private class Empty implements PieceType {
    private boolean colour = false;
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { return new ArrayList<String>(0); }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "EMPTY";
    }
    public void drawSprite() {}
    public boolean getColour() {
        return false;
    }
}