class Menu implements GamePart {
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

    Executable QUITGAME = new Executable() {
        public void run() {
            print("[MENU > QUITGAME] RUN EXECUTABLE: Game quitting...\n");
        }
    };

    // ----------------------------------------------------------------------------
    //                       Menu Functionality & Fields
    // ----------------------------------------------------------------------------
    private boolean visible;
    private Button[] buttons;
    private Executable currentButtonAction;

    public Executable getClickable() {
        return currentButtonAction;
    }

    Menu() {
        buttons = new Button[2];

        buttons[0] = new Button(
            gameStart,
            new Vector2D(0.0f, 0.0f),
            new Size(20.0f, 10.0f)
        );
    }

    public void update() {
        currentButtonAction = buttons[0].getAction();
    }

    public void draw() {

    }
}