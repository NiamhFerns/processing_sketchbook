class Bat extends Rectangle {

    public void update() {
        setPos(mouseX - getWidth() / 2, mouseY - getHeight() / 2);      
    }    

    public Bat() {
        super(120, 30, new Vector2D(600, 500));
        currentColor = color(205, 214, 244);
    }
}