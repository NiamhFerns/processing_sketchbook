class StartMenu extends Menu {
    // ----------------------------------------------------------------------------
    //                              Lambdas to Run
    // ----------------------------------------------------------------------------
    Executable gameStart = new Executable(){
        public void run() {
            print("[MENU > GAMESTART] RUN EXECUTABLE: Game starting...\n");
            GAME.newGame();
            EVENTS.setState(EventStates.GAMEPLAY);
        }
    };

    Executable quitGame = new Executable() {
        public void run() {
            print("[MENU > QUITGAME] RUN EXECUTABLE: Game quitting...\n");
            exit();
        }
    };

    // ----------------------------------------------------------------------------
    //                              Menu Structure
    // ----------------------------------------------------------------------------
    public StartMenu() {
        super("StartMenu");
        addButton(new Button(
            gameStart,
            "StartGame",
            new Vector2D(width / 2 - 150, height / 2 + 150),
            new Size(300.0f, 75.0f),
            color(155)
        ));

        addButton(new Button(
            quitGame,
            "GameQuit",
            new Vector2D(width / 2 - 150, height / 2 + 250),
            new Size(300.0f, 75.0f),
            color(155, 0, 0)
        ));
    }
}