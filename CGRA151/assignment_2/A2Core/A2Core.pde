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

// b r t b l t  r b t l b t r b l t

void update() {
    // Hit boxses neet to be fixed.
    if (ball.nextX(velocity) + ball.radius > width || ball.nextX(velocity) - ball.radius < 0) {
        // if (ball.nextX(velocity) > width) print( "R| ");
        // else print( "L| ");
        // print("Current X Position: " + ball.position.x + " Next X Position: " + (ball.position.x + velocity.x) + " Next Rs at: " + (ball.position.x + ball.radius) + " and " + (ball.position.x - ball.radius) + "\n");
        velocity.invertX();
    }
    if (ball.nextY(velocity) + ball.radius > height || ball.nextY(velocity) - ball.radius < 0) {
        // if (ball.nextY(velocity) > height) print( "B| ");
        // else print( "T| ");
        // print("Current Y Position: " + ball.position.y + " Next Y Position: " + (ball.position.y + velocity.y) + "\n");
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
