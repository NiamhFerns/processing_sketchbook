// Chess Piece States
interface PieceType {
    String name();
    PImage getTexture(boolean colour);
    ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move);
    ArrayList<Pair<Integer, Integer>> getDirections();
}

// This is the base class in a state pattern for each chess piece.
public class ChessPiece implements GamePart {
    private PieceType type;
    
    private String location;
    private boolean colour;
    private ArrayList<String> possibleMoves;

    ChessPiece() {
        type = new Empty();
        possibleMoves = new ArrayList<String>();
    }

    // Create a new chesspiece based on the relevant code char for that piece.
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

    // Returns the type of piece.
    public String getType() { return type.name(); }
    
    // Returns the team this chess piece is assigned to.
    public boolean getColour() { return colour; }
    
    // Returns whether the chesspiece exists or if it's empty.
    public boolean isEmpty() { return type.name().equals("EMPTY"); }

    // The base function that can lead to a recusive check for each cell in a certain direction.
    // Base cases are dependant on each piece and are declared in that pieces class.
    public ArrayList<String> getPossibleMoves() {
        // Get any directions to move for that piece.
        ArrayList<Pair<Integer, Integer>> directions = type.getDirections();
        ArrayList<String> possibleMoves = new ArrayList<String>();
        // Recursively check each direction.
        for (Pair<Integer, Integer> d : directions) { 
            possibleMoves.addAll(type.getPossibleMoves(GAME.board.nextCell(location, d), d));
        }
        // Add the starting location.
        possibleMoves.add(location);
        return possibleMoves;
    }

    // Change where this chess piece is currently situated on the board.
    public void changeLocation(String location) {
        this.location = location;
    }

    // This isn't responsible for updating anything. 
    public void update() { 
    }

    // Draw the chesspiece based on the texture received from it's state.
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

// Represents the absence of a chess piece.
private class Empty implements PieceType {
    public ArrayList<String> getPossibleMoves(String cellID, Pair<Integer, Integer> move) { return new ArrayList<String>(0); }
    public ArrayList<Pair<Integer, Integer>> getDirections() { return new ArrayList<Pair<Integer, Integer>>(); }
    public String name() {
        return "EMPTY";
    }
    public PImage getTexture(boolean colour) { return new PImage(0, 0); }
}