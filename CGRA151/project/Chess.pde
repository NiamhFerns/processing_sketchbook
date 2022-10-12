class Chess {
    private ChessBoard board;
    private ArrayList<GamePart> parts; // ECS ArrayList
    Menu menu;

    public void tick() {
        for (GamePart part : parts) { part.update(); }
        for (GamePart part : parts) { part.draw();   }
    }

    public void newGame() {
        parts = new ArrayList<GamePart>();
        
        board = new ChessBoard();
        parts.add(new ChessUI());
        parts.add(board);
        resetPieces();
        
        menu = new PauseMenu();
        menu.setVisible(false);
        parts.add(menu);

    }

    public void resetPieces() {
        // Empty the pieces.
        board.clear();
        // Load the default board.
        String[] chessPieces = loadStrings("ResetPieces.txt");
        for (String piece : chessPieces) {
            // Format: "cellID,type,colour". (0 == white, 1 == black)
            String[] pieceInfo = piece.split(",");
            board.addPiece(pieceInfo[0], new ChessPiece(pieceInfo[0], pieceInfo[1], pieceInfo[2].equals("b")));
        }
    }
    
    public void exitToMenu() {
        parts = new ArrayList<GamePart>();
        menu = new StartMenu();
        menu.setVisible(true);
        parts.add(menu);
    }

    Chess() {
        // Here we're initialising a very basic ECS that will be based on an observer.
        // Each part of the game will, as it's created, be added to this list and will have the correct methods called every tick.
        parts = new ArrayList<GamePart>();

        // menu = new StartMenu();
        menu = new StartMenu();
        parts.add(menu);
    }
}