color background = color(255, 255, 255);
Ball ball;
Bat bat;

int targetFPS;
float dt, previousTime;

private void deltaTime() {
    dt = millis() - previousTime;
    previousTime = millis();
}


void setup() {
    size(1280, 760);

    ball = new Ball(new Vector2D(30, 30), 25, new Vector2D(0.2, 0.2));
    bat = new Bat();
}

private void update() {
    deltaTime();

    // Update Objects.
    ball.update();
    bat.update();
}

void draw(){
    clear();    
    background(background);

    update();

    ball.draw();
    bat.draw();
}