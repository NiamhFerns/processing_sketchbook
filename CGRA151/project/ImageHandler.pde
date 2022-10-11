public enum PieceTexture {
    ROOK, KNIGHT, BISHOP, QUEEN, KING, PAWN
}

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
        bishop[1] = loadImage("textures/oBishop-black.png");
        rook[0] = loadImage("textures/oRook-white.png");
        rook[1] = loadImage("textures/oRook-black.png");
        queen[0] = loadImage("textures/oQueen-white.png");
        queen[1] = loadImage("textures/oQueen-black.png");
        king[0] = loadImage("textures/oKing-white.png");
        king[1] = loadImage("textures/oKing-black.png");
        knight[0] = loadImage("textures/oKnight-white.png");
        knight[1] = loadImage("textures/oKnight-black.png");
        pawn[0] = loadImage("textures/oPawn-white.png");
        pawn[1] = loadImage("textures/oPawn-black.png");
    }
}