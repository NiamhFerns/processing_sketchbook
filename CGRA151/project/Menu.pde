abstract class Menu implements GamePart {
    // ----------------------------------------------------------------------------
    //                       Menu Functionality & Fields
    // ----------------------------------------------------------------------------
    private boolean visible;
    private HashMap<String, Button> buttons;
    private Executable currentButtonAction;
    private String menuName;

    public Executable getClickable() {
        return currentButtonAction;
    }

    protected void addButton(Button button) {
        buttons.put(button.getLabel(), button);
    }

    Menu(String menuName) {
        buttons = new HashMap<String, Button>();
        visible = true;
        this.menuName = menuName;
    }
    
    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public boolean visible() { return visible; } 

    public String getName() { return menuName; }

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
            exit();
        }
    };

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
        }
    };
    // ----------------------------------------------------------------------------
    //                              Lambdas to Run
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
        if (visible()) super.draw();
    }
}