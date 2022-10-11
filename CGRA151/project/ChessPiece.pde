// Chess Piece States
interface PieceType {
    String name();
    PImage getTexture(boolean colour);
    ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move);
    ArrayList<Pair<Integer, Integer>> getDirections();
}

public class ChessPiece implements GamePart {
    private PieceType type;
    
    private String location;
    private boolean colour;
    private ArrayList<String> possibleMoves;

    ChessPiece() {
        type = new Empty();
        possibleMoves = new ArrayList<String>();
    }

    ChessPiece(String location, String piece, boolean colour) {
        // print((piece != "#" ? piece : "empty") + "\n");
        this.colour = colour;
        this.location = location;
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
                type = new PawnPiece(colour);
                break;
            case "np":
                type = new NewPawnPiece(colour);
                break;
            default:
                type = new Empty();
        }
        possibleMoves = new ArrayList<String>();
    }

    public String getType() { return type.name(); }
    
    public boolean getColour() { return colour; }
    
    public boolean isEmpty() { return type.name().equals("EMPTY"); }

    public ArrayList<String> getPossibleMoves() {
        ArrayList<Pair<Integer, Integer>> directions = type.getDirections();
        ArrayList<String> possibleMoves = new ArrayList<String>();
        for (Pair<Integer, Integer> d : directions) { 
            possibleMoves.addAll(type.getPossibleMoves(GAME.board.nextCell(location, d), d));
        }
        possibleMoves.add(location);
        return possibleMoves;
    }

    public void changeLocation(String location) {
        this.location = location;
    }
    
    public void update() { 
    }

    public void draw()   {
        // image(type.getSprite(), )
        Vector2D position = GAME.board.getPositionByCellID(location);
        imageMode(CENTER);
        fill(180, 190, colour ? 254 : 0);
        // rect(position.x() + (CELLSIZE / 2), position.y() + (CELLSIZE / 2), CELLSIZE / 2, CELLSIZE / 2);
        image(type.getTexture(colour), position.x() + (CELLSIZE / 2), position.y() + (CELLSIZE / 2));
        imageMode(CORNER);
    }
}

private class Empty implements PieceType {
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { return new ArrayList<String>(0); }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "EMPTY";
    }
    public PImage getTexture(boolean colour) { return new PImage(0, 0); }
}