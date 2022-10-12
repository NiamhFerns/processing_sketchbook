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

    Executable enableTimer = new Executable() {
        public void run() {
            print("[MENU > ENABLE TIMER] RUN EXECUTABLE: Timer is now: " + OPTIONAL_FEATURES.getStatus(OptionalComponents.TIMER) + "\n");
            OPTIONAL_FEATURES.toggle(OptionalComponents.TIMER);
        }
    };
    
    Executable enableRotation = new Executable() {
        public void run() {
            print("[MENU > ENABLE TIMER] RUN EXECUTABLE: Rotation is now: " + OPTIONAL_FEATURES.getStatus(OptionalComponents.BOARD_ROTATION) + "\n");
            OPTIONAL_FEATURES.toggle(OptionalComponents.BOARD_ROTATION);
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
            new Vector2D(width / 2 - 150, height / 2 - 150),
            new Size(300.0f, 75.0f),
            color(155)
        ));

        addButton(new Button(
            enableTimer,
            "Toggle Timer",
            new Vector2D(width / 2 - 150, height / 2 + 50),
            new Size(300.0f, 75.0f),
            color(122)
        ));

        addButton(new Button(
            enableRotation,
            "Toggle Rotation",
            new Vector2D(width / 2 - 150, height / 2 + 150),
            new Size(300.0f, 75.0f),
            color(122)
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