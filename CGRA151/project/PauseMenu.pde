// See Menu.pde for better understanding.
class PauseMenu extends Menu {
    // ----------------------------------------------------------------------------
    //                              Lambdas to Run
    // ----------------------------------------------------------------------------
    Executable newGame = new Executable(){
        public void run() {
            GAME.newGame();
            EVENTS.setState(EventStates.GAMEPLAY);
        }
    };
    
    Executable returnToStart = new Executable() {
        public void run() {
            GAME.exitToMenu();
        }
    };

    Executable QUITGAME = new Executable() {
        public void run() {
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