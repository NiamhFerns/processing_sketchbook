color background = color(255, 255, 255);
Vector2D velocity, acceleration;
Ball ball;

double deltaTime() {

}

void setup() {
    size(680, 420);
    frameRate(60);

    // Velocity
    velocity = new Vector2D(3.0, 3.0);
    acceleration = new Vector2D(0.0, 0.0);

    // Ball
    ball = new Ball(new Vector2D(100, 100), 50.0);
}

void update() {
    // Hit boxses neet to be fixed.
    if (ball.nextX(velocity) > width || ball.nextX(velocity) < 0) {
        velocity.invertX();
    }
    if (ball.nextY(velocity) > height || ball.nextY(velocity) < 0) {
        velocity.invertY();
    }
    ball.move(velocity);
}

void draw() {
    clear();    
    background(background);

    update();

    ball.draw();
}
