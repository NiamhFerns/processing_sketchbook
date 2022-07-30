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

public class A1Extn extends PApplet {

ArrayList<Line> lines = new ArrayList<Line>();
Consts consts = new Consts();
Maths maths = new Maths();
int frame = 0;


public void setup() {
        
    background(0x181825);
    lines.add(new Line());
    frameRate(120);
}

public void update() {
    // Go through each line and call it's move function.
    for (Line l : lines) {
        l.move();
    }

    // 1% chance of spawning a new line.
    if (maths.rChance(1)) {
        lines.add(new Line());
    }
}

public void draw() {
    // Draw each of our lines. DO NOT CLEAR SCREEN.
    for (Line l : lines) {
        l.draw();
    }

    // Update for next draw.
    update();

    // Clear the screen every minute so that we don't completely fill it.
    if (frame == consts.change) {
        clear();
        background(0x181825);
        lines.clear();
        lines.add(new Line());
        frame = 0;
    }
    frame++;
}
class Consts {
    // The various consts for our program. I'd have prefered a struct but not sure how to get
    // what I was going for here so this is a gross implementation.
    int lineWidth;
    int chanceOfLine;
    int change;

    // Colour scheme based off the catppuccin colour scheme found here:
    // https://github.com/catppuccin/catppuccin.git
    int[] colors = {
        color(245, 224, 220),
        color(242, 205, 205),
        color(245, 194, 231),
        color(203, 166, 247),
        color(243, 139, 168),
        color(235, 160, 172),
        color(250, 179, 135),
        color(249, 226, 175),
        color(166, 227, 161),
        color(148, 226, 213),
        color(137, 220, 235),
        color(116, 199, 236),
        color(137, 180, 250),
        color(180, 190, 254)
    };

    Consts() {
        lineWidth = 3;
        chanceOfLine = 10;
        change = 3600;
    }
}
class Line {
    int x, y, directionX, directionY;
    int lineColour;
    boolean axis, lastMoved;

    public void move() {

        // 2% chance of changing the axis that the line is moving on
        if (maths.rChance(2.0f)) axis = !axis;
        // Move in the correct axis and set it as the lastMoved axis.
        if (axis) {
            x += directionX;
            lastMoved = true;
        }
        else {
            y += directionY;
            lastMoved = false;
        }

        // lastMoved true means x axis was the lastMoved axis.
        // This is to prevent the line doubling back on itself.
        if (lastMoved) directionY = maths.rChance(5.0f) ? 1 : -1;
        else directionX = maths.rChance(5.0f) ? 1 : -1;
    }

    public void draw() {
        fill(lineColour);
        noStroke();

        // The one shape. c:
        ellipse(x, y, consts.lineWidth * 2, consts.lineWidth * 2);
    }

    Line() {
        x = PApplet.parseInt(random(0, width));
        y = PApplet.parseInt(random(0, height));

        directionX = maths.rBool() ? 1 : -1;
        directionY = maths.rBool() ? 1 : -1;
        axis = maths.rBool();
        lineColour = consts.colors[PApplet.parseInt(random(0, consts.colors.length))];
    }
}
class Maths {
    public boolean rBool() {
        return random(1) > 0.5f;
    }
    
    public boolean rChance(float percentage) {
        return random(1) < percentage / 100;
    }
}
  public void settings() {  size(640, 480); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A1Extn" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
