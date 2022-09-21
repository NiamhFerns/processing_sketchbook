abstract class Menu implements GamePart {
    // ----------------------------------------------------------------------------
    //                       Menu Functionality & Fields
    // ----------------------------------------------------------------------------
    private boolean visible;
    private HashMap<String, Button> buttons;
    private Executable currentButtonAction;

    public Executable getClickable() {
        return currentButtonAction;
    }

    protected void addButton(Button button) {
        buttons.put(button.getLabel(), button);
    }

    Menu() {
        buttons = new HashMap<String, Button>();

    }

    public void update() {
        currentButtonAction = new EMPTY_EXECUTABLE();
        for(Button b : buttons.values()) {
            boolean xBound = mouseX > b.x() && mouseX < b.x() + b.width();
            boolean yBound = mouseY > b.y() && mouseY < b.y() + b.height();
            if (xBound && yBound) {
                currentButtonAction = b.getAction();
                b.highlight();
                break;
            }
            b.unhighlight();
        }
    }

    public void draw() {
        for(Button b : buttons.values()) {
            fill(b.buttonColor());
            noStroke();
            rect(b.x(), b.y(), b.width(), b.height());
        }
    }
}

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
        }
    };

    public StartMenu() {
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

class PauseMenu extends Menu {
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
    
    public PauseMenu() {
        addButton(new Button(
            gameStart,
            "StartGame",
            new Vector2D(0.0f, 0.0f),
            new Size(20.0f, 10.0f),
            color(0)
        ));
    }
}