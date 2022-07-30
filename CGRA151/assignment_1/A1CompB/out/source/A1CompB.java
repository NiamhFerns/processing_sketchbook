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

public class A1CompB extends PApplet {
  public void setup() {

background(155, 155, 155);
stroke(0, 0, 0);
strokeWeight(1);

int max = 60;

for (int i = 0; i < 150; ++i) {
        int px = PApplet.parseInt(random(0, width)), py = PApplet.parseInt(random(0, height));
        fill(255, 255, 255);
        triangle(
            PApplet.parseInt(random(px - max, px + max)), PApplet.parseInt(random(py - max, py + max)),
            PApplet.parseInt(random(px - max, px + max)), PApplet.parseInt(random(py - max, py + max)), 
            PApplet.parseInt(random(px - max, px + max)), PApplet.parseInt(random(py - max, py + max))
        );
}
    noLoop();
  }

  public void settings() { size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A1CompB" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
