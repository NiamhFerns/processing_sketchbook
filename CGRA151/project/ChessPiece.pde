// Chess Piece States
interface PieceType {
    public ArrayList<String> getPossibleMoves();
}

private class KingPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

private class QueenPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

private class BishopPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

private class KnightPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

private class RookPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

private class PawnPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

private class EmptyPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
}

public class ChessPiece implements GamePart {
    private PieceType type;
    private ArrayList<String> possibleMoves;
    private boolean recheckMoves = true;

    public void update() { if(recheckMoves) possibleMoves = type.getPossibleMoves(); }
    public void draw()   {}

    ChessPiece() {
        type = new EmptyPiece();
        possibleMoves = new ArrayList<String>();
    }
}