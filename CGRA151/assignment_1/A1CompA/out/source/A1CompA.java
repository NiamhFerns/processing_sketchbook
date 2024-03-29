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

public class A1CompA extends PApplet {
  public void setup() {

background(255, 255, 255);
stroke(0, 0, 0);
strokeWeight(1);

int blockSize = 5;
int y = 0;
int x = 0;
int lineSpacing = 25;
int gapMin = 5;
int gapMax = 20;

for (int i = 0; i < height; i += lineSpacing) {
    line(0, i, width, i);
}

while(y < 500) {
    while (x < 500) {
        fill(155, 155, 155);
        rectMode(CORNER);
        rect(x, y, blockSize, lineSpacing);
        x += blockSize + PApplet.parseInt(random(gapMin, gapMax));
    }
    x = 0;
    y += lineSpacing;
}
    noLoop();
  }

  public void settings() { size(500, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "A1CompA" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
