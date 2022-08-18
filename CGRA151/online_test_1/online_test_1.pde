size(300, 300);
background(255,255,255);
noFill();
rectMode(CENTER);
float dimension = width / 3;
float diamondDimension = sqrt((dimension * dimension) + (dimension * dimension));
translate(width / 2, width / 2);
rect(0.0, 0.0, dimension, dimension);           // Square
for(int i = 0; i < 4; i++) {              // Circles
    rotate(PI/2);
    ellipse(dimension / 2, 0, dimension, dimension);  
}
rotate(PI/4);
rect(0, 0, diamondDimension, diamondDimension); // Diamond