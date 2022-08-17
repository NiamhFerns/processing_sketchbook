size(300, 300);
background(255,255,255);
noFill();
rectMode(CENTER);
float dimension = 100;
float diamondDimension = sqrt((dimension * dimension) + (dimension * dimension));
translate(150, 150);
rect(0.0, 0.0, dimension, dimension);           // Square
for(int i = 0; i < 360; i += 90) {              // Circles
    rotate(radians(i));
    ellipse(dimension / 2, 0, dimension, dimension);  
}
rotate(PI/4);
rect(0, 0, diamondDimension, diamondDimension); // Diamond