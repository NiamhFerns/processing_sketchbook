public enum PieceTexture {
    ROOK, KNIGHT, BISHOP, QUEEN, KING, PAWN
}

public class ImageHandler {
    private PImage[] rook = new PImage[2];

    public PImage get(PieceTexture piece, boolean colour) {
        return colour ? rook[1] : rook[0];
    }

    private ImageHandler() {
        PImage t = loadImage("textures/rook-full.png");
        rook[0] = t.get(0, 0, 42, 42);
        rook[0].resize((int)(CELLSIZE * 0.6), (int)(CELLSIZE * 0.6));
        rook[1] = t.get(42, 0, 42, 42);
        rook[1].resize((int)(CELLSIZE * 0.6), (int)(CELLSIZE * 0.6));
    }
}