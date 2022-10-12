public class ChessUI implements GamePart {
    private int playAreaOffset = (int)(BOARDOFFSET * 0.85);
    private PImage[] rows;
    private PImage[] cols;

    public void update() {

    }

    public void draw() {
        fill(color(69, 77, 95));
        rect(0, 0, width, height);
        fill(color(230, 234, 215));
        rect(playAreaOffset, playAreaOffset, (width) - (playAreaOffset * 2), (height - 200) - (playAreaOffset * 2));

        imageMode(CENTER);
        for (int i = 0; i < 8; ++i) {
            image(rows[i], BOARDOFFSET / 2, BOARDOFFSET + (CELLSIZE / 2) + (i * CELLSIZE));
        }
        imageMode(CENTER);
        for (int i = 0; i < 8; ++i) {
            image(cols[i], BOARDOFFSET + (CELLSIZE / 2) + (i * CELLSIZE), (height - 200) - BOARDOFFSET / 2);
        }

        fill(color(49, 57, 75));
        // rect(BOARDSIZE + (BOARDOFFSET * 2), 0, width, height);
        rect(0, BOARDSIZE + (BOARDOFFSET * 2), width, height);
    }

    public ChessUI() {
        rows = new PImage[8];
        cols = new PImage[8];

        PImage t = loadImage("textures/textRows.png");
        for (int i = 0; i < 8; ++i) {
            rows[i] = t.get(i * 3, 0, 3, 3);
            rows[i].resize(12, 12);
        }
        t = loadImage("textures/textCols.png");
        for (int i = 0; i < 8; ++i) {
            cols[i] = t.get(i * 3, 0, 3, 3);
            cols[i].resize(12, 12);
        }
    }
}