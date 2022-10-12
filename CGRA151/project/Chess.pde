class Chess {
    private ChessBoard board;
    private ArrayList<GamePart> parts; // ECS ArrayList
    Menu menu;

    ArrayList<ChessPiece> piecesRemaining;

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
        print("Features length: " + OPTIONAL_FEATURES.get().size());
        parts.addAll(OPTIONAL_FEATURES.get());
        OPTIONAL_FEATURES.reset(); 
        EVENTS.resetMoves();
        
        menu = new PauseMenu();
        menu.setVisible(false);
        parts.add(menu);

    }

    public void resetPieces() {
        // Empty the pieces.
        board.clear();
        piecesRemaining = new ArrayList<ChessPiece>();
        // Load the default board.
        String[] chessPieces = loadStrings("ResetPieces.txt");
        for (String piece : chessPieces) {
            // Format: "cellID,type,colour". (0 == white, 1 == black)
            String[] pieceInfo = piece.split(",");
            ChessPiece pieceOb = new ChessPiece(pieceInfo[0], pieceInfo[1], pieceInfo[2].equals("b"));
            board.addPiece(pieceInfo[0], pieceOb);
            piecesRemaining.add(pieceOb);
        }
    }

    public void killPiece(ChessPiece piece) {
        piecesRemaining.remove(piece);
        print(piecesRemaining.size() + "\n");
        if (piece.getType() == "King") onGameEnd("Game Over", piece.getColour() ? "White" : "Black");
        if (piecesRemaining.size() == 2) onGameEnd("Game Over", "Draw");
    }

    public void addPiece(ChessPiece piece) {
        piecesRemaining.add(piece);
    }
    
    public void exitToMenu() {
        parts = new ArrayList<GamePart>();
        menu = new StartMenu();
        menu.setVisible(true);
        parts.add(menu);
    }

    public void onGameEnd(String message, String winner) {
        print("Message: " + message + " Winner: " + winner + "\n");
        EVENTS.setState(EventStates.MENU);
        parts = new ArrayList<GamePart>();
        menu = new StartMenu();
        menu.setVisible(true);
        parts.add(menu);
    }

    Chess() {
        // Here we're initialising a very basic ECS that will be based on an observer.
        // Each part of the game will, as it's created, be added to this list and will have the correct methods called every tick.
        parts = new ArrayList<GamePart>();
        piecesRemaining = new ArrayList<ChessPiece>();

        // menu = new StartMenu();
        menu = new StartMenu();
        parts.add(menu);
    }
}