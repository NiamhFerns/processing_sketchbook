class PauseMenu extends Menu {
    // ----------------------------------------------------------------------------
    //                              Lambdas to Run
    // ----------------------------------------------------------------------------
    Executable newGame = new Executable(){
        public void run() {
            print("[MENU > NEWGAME] RUN EXECUTABLE: Resetting board...\n");
            GAME.newGame();
            EVENTS.setState(EventStates.GAMEPLAY);
        }
    };
    
    Executable returnToStart = new Executable() {
        public void run() {
            print("[MENU > RETURNTOSTART] RUN EXECUTABLE: Exiting level and returning to start screen...\n");
            GAME.exitToMenu();
        }
    };

    Executable QUITGAME = new Executable() {
        public void run() {
            print("[MENU > QUITGAME] RUN EXECUTABLE: Game quitting...\n");
            exit();
        }
    };

    // ----------------------------------------------------------------------------
    //                              Menu Structure
    // ----------------------------------------------------------------------------
    public PauseMenu() {
        super("PauseMenu");
        addButton(new Button(
            newGame,
            "NewGame",
            new Vector2D(width / 2 - 150, height / 2 + 150),
            new Size(300.0f, 75.0f),
            color(0)
        ));
        addButton(new Button(
            returnToStart,
            "exitToMenu",
            new Vector2D(width / 2 - 150, height / 2 + 250),
            new Size(300.0f, 75.0f),
            color(0)
        ));
    }
    
    public void draw() {
        if (!visible()) return;
        fill(155, 155, 155, 200);
        rect(0, 0, width, height);
        super.draw();
    }
}