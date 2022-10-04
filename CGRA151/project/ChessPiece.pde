// Chess Piece States
interface PieceType {
    ArrayList<String> getPossibleMoves();
    String name();
}

private class KingPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "King";
    }
}

private class QueenPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Queen";
    }
}

private class BishopPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Bishop";
    }
}

private class KnightPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Knight";
    }
}

private class RookPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Rook";
    }
}

private class PawnPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Pawn";
    }
}

private class Empty implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "EMPTY";
    }
}

public class ChessPiece implements GamePart {
    private PieceType type;
    private ArrayList<String> possibleMoves;
    private boolean recheckMoves = true;

    public void update() { if(recheckMoves) possibleMoves = type.getPossibleMoves(); }
    public void draw()   {}

    public String getType() { return type.name(); }

    public boolean isEmpty() { return type.name().equals("EMPTY"); }

    public ArrayList<Cell> getPossibleMoves() {
        return new ArrayList<Cell>(0);
    }

    ChessPiece() {
        type = new Empty();
        possibleMoves = new ArrayList<String>();
    }
    ChessPiece(String piece) {
        // print((piece != "#" ? piece : "empty") + "\n");
        switch (piece) {
            case "k":
                type = new KingPiece();
                break;
            case "q":
                type = new QueenPiece();
                break;
            case "b":
                type = new BishopPiece();
                break;
            case "h":
                type = new KnightPiece();
                break;
            case "r":
                type = new RookPiece();
                break;
            case "p":
                type = new PawnPiece();
                break;
            default:
                type = new Empty();
        }
        possibleMoves = new ArrayList<String>();
    }
}