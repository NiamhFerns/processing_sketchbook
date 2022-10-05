// Chess Piece States
interface PieceType {
    ArrayList<String> getPossibleMoves();
    String name();
    void drawSprite();
    boolean getColour(); // false == white. THink of this as a latch.
}

private class KingPiece implements PieceType {
    private boolean colour;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
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
    }
}

private class QueenPiece implements PieceType {
    private boolean colour;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Queen";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(250, 179, colour ? 135 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public QueenPiece(boolean colour) {
        this.colour = colour;
    }
}

private class BishopPiece implements PieceType {
    private boolean colour;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Bishop";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(245, 194, colour ? 231 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public BishopPiece(boolean colour) {
        this.colour = colour;
    }
}

private class KnightPiece implements PieceType {
    private boolean colour;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Knight";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(166, 227, colour ? 161 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public KnightPiece(boolean colour) {
        this.colour = colour;
    }
}

private class RookPiece implements PieceType {
    private boolean colour;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Rook";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(180, 190, colour ? 254 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public RookPiece(boolean colour) {
        this.colour = colour;
    }
}

private class PawnPiece implements PieceType {
    private boolean colour;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "Pawn";
    }
    public void drawSprite() { 
        rectMode(CENTER);
        fill(116, 199, colour ? 236 : 0);
        rect(0, 0, CELLSIZE / 2, CELLSIZE / 2);
        rectMode(CORNER);
    }
    public boolean getColour() {
        return colour;
    }
    public PawnPiece(boolean colour) {
        this.colour = colour;
    }
}

private class Empty implements PieceType {
    private boolean colour = false;
    public ArrayList<String> getPossibleMoves() { return new ArrayList<String>(0); }
    public String name() {
        return "EMPTY";
    }
    public void drawSprite() {}
    public boolean getColour() {
        return false;
    }
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
    public boolean getColour() { return type.getColour(); }

    public boolean isEmpty() { return type.name().equals("EMPTY"); }

    public ArrayList<Cell> getPossibleMoves() {
        return new ArrayList<Cell>(0);
    }

    ChessPiece() {
        type = new Empty();
        possibleMoves = new ArrayList<String>();
    }
    ChessPiece(String piece, boolean colour) {
        // print((piece != "#" ? piece : "empty") + "\n");
        switch (piece) {
            case "k":
                type = new KingPiece(colour);
                break;
            case "q":
                type = new QueenPiece(colour);
                break;
            case "b":
                type = new BishopPiece(colour);
                break;
            case "h":
                type = new KnightPiece(colour);
                break;
            case "r":
                type = new RookPiece(colour);
                break;
            case "p":
                type = new PawnPiece(colour);
                break;
            default:
                type = new Empty();
        }
        possibleMoves = new ArrayList<String>();
    }
}