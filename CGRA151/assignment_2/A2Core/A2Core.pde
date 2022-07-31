color background = color(255, 255, 255);
Vector2D velocity, acceleration;
Ball ball;

double deltaTime() {
    return 0.0;
}

void setup() {
    size(680, 420);
    frameRate(120);

    // Velocity
    velocity = new Vector2D(1.0, 1.0);
    acceleration = new Vector2D(0.0, 0.0);

    // Ball
    ball = new Ball(new Vector2D(100, 100), 25.0);
}

void update() {
    // Hit boxses neet to be fixed.
    if (ball.nextX(velocity) + ball.radius > width || ball.nextX(velocity) - ball.radius < 0) velocity.invertX();
    if (ball.nextY(velocity) + ball.radius > height || ball.nextY(velocity) - ball.radius < 0) velocity.invertY();
    ball.move(velocity, dt);
}

void draw() {
    clear();    
    background(background);

    update();

    ball.draw();
}
