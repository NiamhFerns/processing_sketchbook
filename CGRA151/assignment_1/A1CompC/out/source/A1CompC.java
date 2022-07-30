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

public class A1CompC extends PApplet {

int r;

public void setup() {
    
    r = 100;
}

public void draw() {
    clear();
    background(255, 255, 255);
    stroke(0, 0, 0);
    strokeWeight(1);

    // Decide fill colour.
    fill(0, 0, 255);
    if (mousePressed) fill(255, 0, 0);

    // Draw Circle
    ellipse(mouseX, mouseY, r, r);
}
  public void settings() {  size(512, 512); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A1CompC" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
