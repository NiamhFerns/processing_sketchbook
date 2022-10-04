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