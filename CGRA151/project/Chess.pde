class Chess {
    private ChessBoard board;                        // Main game board.
    private ArrayList<GamePart> parts;               // ECS ArrayList.
    private Menu menu;                               // The current Menu.
    private ArrayList<ChessPiece> piecesRemaining;   // All chesspieces current in play.

    // The primary observer. Propogates out to all entities in ECS.
    public void tick() {
        for (GamePart part : parts) { part.update(); }
        for (GamePart part : parts) { part.draw();   }
    }

    // Instantiate a new round of chess. with a reset board and fresh pieces.
    public void newGame() {
        // Clear the board.
        parts = new ArrayList<GamePart>();

        // Add a new board, UI, and fresh pieces.
        board = new ChessBoard();
        parts.add(new ChessUI());
        parts.add(board);
        resetPieces();

        // Add any features the user has turned on.
        parts.addAll(OPTIONAL_FEATURES.get());
        OPTIONAL_FEATURES.reset();

        // Reset the move tracker and set the correct menu.
        EVENTS.resetMoves();
        menu = new PauseMenu();
        menu.setVisible(false);
        parts.add(menu);

    }

    public void resetPieces() {
        // Empty the pieces.
        board.clear();
        piecesRemaining = new ArrayList<ChessPiece>();

        // Load the default board layout for chess with white on bottom.
        String[] chessPieces = loadStrings("ResetPieces.txt");
        for (String piece : chessPieces) {
            // Format: "cellID,type,colour". (0 == white, 1 == black)
            String[] pieceInfo = piece.split(",");
            ChessPiece pieceOb = new ChessPiece(pieceInfo[0], pieceInfo[1], pieceInfo[2].equals("b"));
            board.addPiece(pieceInfo[0], pieceOb);
            piecesRemaining.add(pieceOb);
        }
    }
    
    // Remove a piece from play after it has been taken by an opponent.
    public void killPiece(ChessPiece piece) {
        piecesRemaining.remove(piece);
        if (piece.getType() == "King") onGameEnd("Game Over", piece.getColour() ? "White" : "Black");
        if (piecesRemaining.size() == 2) onGameEnd("Game Over", "Draw");
    }

    // Re-add a piece to play.
    public void addPiece(ChessPiece piece) {
        piecesRemaining.add(piece);
    }

    // Return the player to the main menu. 
    public void exitToMenu() {
        parts = new ArrayList<GamePart>();
        menu = new StartMenu();
        menu.setVisible(true);
        parts.add(menu);
    }

    // Show the game end screen after a win/loss condition has been met.
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