class Bat extends Rectangle {

    public void update() {
        setPos(mouseX - getWidth() / 2, mouseY - getHeight() / 2);      
    }    

    public Bat() {
        super(150, 50, new Vector2D(600, 500));
    }
}