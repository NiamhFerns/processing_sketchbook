// Each menu is a container for a set of buttons that each have an Executable that can be run.
abstract class Menu implements GamePart {
    // ----------------------------------------------------------------------------
    //                       Menu Functionality & Fields
    // ----------------------------------------------------------------------------
    private boolean visible;
    private HashMap<String, Button> buttons;
    private Executable currentButtonAction;
    private String menuName;

    // Returns the action that can be run with this button.
    public Executable getClickable() {
        return currentButtonAction;
    }

    // Adds a button to the menu.
    protected void addButton(Button button) {
        buttons.put(button.getLabel(), button);
    }

    Menu(String menuName) {
        buttons = new HashMap<String, Button>();
        visible = true;
        this.menuName = menuName;
    }

    // Sets whether the menu is current visible for pauses/popups.  
    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    // Returns whether the menu is currently visible.
    public boolean visible() { return visible; } 

    // Get the menu name.
    public String getName() { return menuName; }

    // check whether the mouse is withing the bounds of a button then highlight that button and set it's action as the current action.
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

    // Draw each of the buttons via delegation.
    public void draw() {
        for(Button b : buttons.values()) {
            fill(b.buttonColor());
            noStroke();
            rect(b.x(), b.y(), b.width(), b.height());
            b.drawText();
        }
    }
}