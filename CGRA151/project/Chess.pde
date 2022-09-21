class Chess {
    private ChessBoard board;
    private ArrayList<GamePart> parts; // ECS ArrayList
    Menu menu;

    public void tick() {
        for (GamePart part : parts) { part.update(); }
        for (GamePart part : parts) { part.draw();   }
    }

    public final void drawBoard() {
        // draw cells.
    }

    public void newGame() {
        parts = new ArrayList<GamePart>();
        parts.add(menu);

        board = new ChessBoard();
        parts.add(board);
    }

    Chess() {
        // Here we're initialising a very basic ECS that will be based on an observer.
        // Each part of the game will, as it's created, be added to this list and will have the correct methods called every tick.
        parts = new ArrayList<GamePart>();
        

        menu = new Menu();
        parts.add(menu);
    }
}
