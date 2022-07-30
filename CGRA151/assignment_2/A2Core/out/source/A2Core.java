import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class A2Core extends PApplet {

int background = color(255, 255, 255);
Vector2D velocity, acceleration;
Ball ball;

public void setup() {
    
    frameRate(60);

    // Velocity
    velocity = new Vector2D(3.0f, 3.0f);
    acceleration = new Vector2D(0.0f, 0.0f);

    // Ball
    ball = new Ball(new Vector2D(100, 100), 50.0f);
}

public void update() {
    if (ball.nextX(velocity) + ball.radius / 2 > width || ball.nextX(velocity) - ball.radius / 2 < 0) {
        velocity.invertX();
    }
    if (ball.nextY(velocity) + ball.radius / 2 > height || ball.nextY(velocity) - ball.radius / 2 < 0) {
        velocity.invertY();
    }
    ball.move(velocity);
}

public void draw() {
    clear();    
    background(background);

    update();

    ball.draw();
}
class Ball {
    private Vector2D position;
    public float radius;
    private int currentColor;

    public void draw() {
        int restore = g.fillColor;
        fill(currentColor);
        ellipse(position.x, position.y, radius, radius);
        fill(restore);
    }

    public Vector2D getPos() {
        // No idea how to return an immutable reference to this object.
        return position;
    }

    public float nextX(Vector2D v) {
        return position.x + v.x;
    }

    public float nextY(Vector2D v) {
        return position.y + v.y;
    }

    public void move(Vector2D velocity) {
        this.position.add(velocity);
    }

    public Ball() {
        // Code Smell but it's fine this.
        position = new Vector2D(0, 0);
        radius = 1;
        currentColor = color(0, 0, 0);
    }

    public Ball(Vector2D position, float radius) {
        currentColor = color(0, 0, 0);
        this.radius = radius;
        this.position = position;
    }
}
class Vector2D {
    float x;
    float y;

    public void invert() {
        x = -x;
        y = -y;
    }

    public void invertX() {
        x = -x;
    }

    public void invertY() {
        y = -y;
    }

    public void reflect() {
        float t = x;
        x = -y;
        y = -t;
    }

    public void add(Vector2D v) {
        x += v.x;
        y += v.y;
    }

    Vector2D() {
        x = 0;
        y = 0;
    }

    Vector2D(float x, float y) {
        this.x = x;
        this.y = y;
    }

    Vector2D(Vector2D v) {
        this.x = v.x;
        this.y = v.y;
    }
}
  public void settings() {  size(680, 420); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A2Core" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
