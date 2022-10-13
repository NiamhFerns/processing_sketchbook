// The possible textures that can be used for a chess piece.
public enum PieceTexture {
    ROOK, KNIGHT, BISHOP, QUEEN, KING, PAWN
}

// This is the same as the cell texture holder just done with a set of arrays.
public class ImageHandler {
    private PImage[] rook = new PImage[2];
    private PImage[] bishop = new PImage[2];
    private PImage[] queen = new PImage[2];
    private PImage[] king = new PImage[2];
    private PImage[] knight = new PImage[2];
    private PImage[] pawn = new PImage[2];

    public PImage get(PieceTexture piece, boolean colour) {
        switch(piece) {
            case ROOK:
                return colour ? rook[1] : rook[0];
            case BISHOP:
                return colour ? bishop[1] : bishop[0];
            case KNIGHT:
                return colour ? knight[1] : knight[0];
            case QUEEN:
                return colour ? queen[1] : queen[0];
            case KING:
                return colour ? king[1] : king[0];
            case PAWN:
                return colour ? pawn[1] : pawn[0];
            default:
                return colour ? bishop[1] : bishop[0];
        }
    }

    private ImageHandler() {
        bishop[0] = loadImage("textures/oBishop-white.png");
        bishop[0].resize((int)(bishop[0].width * 0.1), (int)(bishop[0].height * 0.1));
        bishop[1] = loadImage("textures/oBishop-black.png");
        bishop[1].resize((int)(bishop[1].width * 0.1), (int)(bishop[1].height * 0.1));
        
        rook[0] = loadImage("textures/oRook-white.png");
        rook[0].resize((int)(rook[0].width * 0.1), (int)(rook[0].height * 0.1));
        rook[1] = loadImage("textures/oRook-black.png");
        rook[1].resize((int)(rook[1].width * 0.1), (int)(rook[1].height * 0.1));
        
        queen[0] = loadImage("textures/oQueen-white.png");
        queen[0].resize((int)(queen[0].width * 0.1), (int)(queen[0].height * 0.1));
        queen[1] = loadImage("textures/oQueen-black.png");
        queen[1].resize((int)(queen[1].width * 0.1), (int)(queen[1].height * 0.1));
        
        king[0] = loadImage("textures/oKing-white.png");
        king[0].resize((int)(king[0].width * 0.1), (int)(king[0].height * 0.1));
        king[1] = loadImage("textures/oKing-black.png");
        king[1].resize((int)(king[1].width * 0.1), (int)(king[1].height * 0.1));
        
        knight[0] = loadImage("textures/oKnight-white.png");
        knight[0].resize((int)(knight[0].width * 0.1), (int)(knight[0].height * 0.1));
        knight[1] = loadImage("textures/oKnight-black.png");
        knight[1].resize((int)(knight[1].width * 0.1), (int)(knight[1].height * 0.1));
        
        pawn[0] = loadImage("textures/oPawn-white.png");
        pawn[0].resize((int)(pawn[0].width * 0.1), (int)(pawn[0].height * 0.1));
        pawn[1] = loadImage("textures/oPawn-black.png");
        pawn[1].resize((int)(pawn[1].width * 0.1), (int)(pawn[1].height * 0.1));
    }
}