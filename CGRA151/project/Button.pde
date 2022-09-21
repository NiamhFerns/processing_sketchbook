// Button in this case is just a conceptual holder for the attributes a button would have.
// It is not responsible for how that button functions except for holding the functionality
// assigned to it by the thing creating it.
class Button {
    private Executable action;
    private Size dimensions;
    private Vector2D position;
    private String label;
    private color buttonColor;
    private boolean highlighted;

    public float x() { return position.x(); }
    
    public float y() { return position.y(); }

    public float width() { return dimensions.width; }
    
    public float height() { return dimensions.height; }

    public color buttonColor() { return highlighted ? color(0) : buttonColor; }

    public Executable getAction() { return action; }

    public String getLabel() { return label; }

    public void highlight() { highlighted = true; }

    public void unhighlight() { highlighted = false; }

    public Button(Executable action, String label, Vector2D position, Size dimensions, color buttonColor) {
        this.action = action;
        this.label = label;
        this.dimensions = dimensions;
        this.position = position;
        this.buttonColor = buttonColor;
    }
}