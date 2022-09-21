class Button {
    private Executable action;
    private Size dimensions;
    private Vector2D position;

    public Executable getAction() { return action; }

    public Button(Executable action, Vector2D position, Size dimensions) {
        this.action = action;
        this.dimensions = dimensions;
        this.position = position;
    }
}