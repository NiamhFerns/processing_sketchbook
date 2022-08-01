color background = color(255, 255, 255);
Vector2D velocity, activeEdge, circleRay;
Ball ball;
Bat bat;

int targetFPS;
double dt, previousTime;

void deltaTime() {
    dt = millis() - previousTime;
    previousTime = millis();
}

Vector2D rayToCircle() {
    activeEdge.x = max(bat.position.x, min(bat.position.x + bat.w, ball.nextX(velocity)));
    activeEdge.y = max(bat.position.y, min(bat.position.y + bat.h, ball.nextY(velocity)));

    circleRay.x = activeEdge.x - ball.nextX(velocity);
    circleRay.y = activeEdge.y - ball.nextY(velocity);
}

void setup() {
    size(1280, 760);
    // Doing it this way so it's accessible later.
    targetFPS = 30;
    dt = 0.0;
    previousTime = 0.0;
    deltaTime();
    frameRate(targetFPS);

    // Velocity
    velocity = new Vector2D(0.2, 0.2);
    activeEdge = new Vector2D(0.0, 0.0);
    circleRay = new Vector2D(0.0f, 0.0f); 
    
    ball = new Ball(new Vector2D(100, 100), 20.0); 
    bat = new Bat(150, 30, new Vector2D(mouseX, mouseY));
}

void update() {
    deltaTime();
    rayToCircle();

    // Hit boxses neet to be fixed.
    if (ball.nextX(velocity) + ball.radius > width || ball.nextX(velocity) - ball.radius < 0) velocity.invertX();
    if (ball.nextY(velocity) + ball.radius > height || ball.nextY(velocity) - ball.radius < 0) velocity.invertY();
    
    bat.move();
    if (circleRay.norm() > ball.radius) {
        ball.move(velocity, dt);
    }
    else {
        boolean invX, invY;
        
    } 
}

void draw(){
    clear();    
    background(background);

    update();

    ball.draw();
    bat.draw();
}