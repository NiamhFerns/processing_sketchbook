// Chess Piece States
interface PieceType {
    ArrayList<String> getPossibleMoves();
    String name();
    void drawSprite();
}

private class KingPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "King";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(243, 139, 168);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
}

private class QueenPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Queen";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(250, 179, 135);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
}

private class BishopPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Bishop";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(245, 194, 231);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
}

private class KnightPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Knight";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(166, 227, 161);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
}

private class RookPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Rook";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(180, 190, 254);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
}

private class PawnPiece implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Pawn";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(116, 199, 236);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
}

private class Empty implements PieceType {
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "EMPTY";
    }
    public void drawSprite() {}
}

public class ChessPiece implements GamePart {
    private PieceType type;
    private ArrayList<String> possibleMoves;
    private boolean recheckMoves = true;

    public void update() { if(recheckMoves) possibleMoves = type.getPossibleMoves(); }
    public void draw()   {
        type.drawSprite();
    }

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