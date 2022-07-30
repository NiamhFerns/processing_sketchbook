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

public class A1Core extends PApplet {

public void setup() {
    
}

public void draw() {
    // Reset background colour and stroke
    background(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(1);

    // Rectangle
    fill(0, 0, 255);
    rect(20, 40, 200, 100);

    // Ellipse
    fill(0, 255, 0);
    ellipse(120, 240, 200, 100);

    // Triangle
    fill(255, 0, 0);
    triangle(20, 390, 120, 340, 220, 440);

    // Arrow
    beginShape();
    fill(255, 255, 0);
    vertex(450, 100);
    vertex(350, 50);
    vertex(350, 80);
    vertex(300, 80);
    vertex(300, 120);
    vertex(350, 120);
    vertex(350, 150);
    vertex(450, 100);
    endShape();

    // Parallel Lines
    strokeWeight(2);
    stroke(255, 0, 0);
    line(300, 310, 340, 440);
    strokeWeight(4);
    stroke(0, 255, 0);
    line(350, 310, 390, 440);
    strokeWeight(6);
    stroke(150, 0, 255);
    line(400, 310, 440, 440);
}
  public void settings() {  size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A1Core" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
