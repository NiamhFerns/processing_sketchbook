color background = color(255, 255, 255);

void setup() {
    size(200, 200);
    
    // noLoop(); // You can comment this then uncomment the commented code in the draw() function
              // for an interactive line drawing demonstration.
    noSmooth();
}

private void myLine(float x0, float y0, float x1, float y1) { // This is so gross oh god it's so ugly but it works so I'm not touching it.
    float m = (y1 - y0) / (x1 - x0);
    int xi = round(x0);
    
    // Octant 3 & 7
    if (m < -1) y1 = y0 + (y0-y1);
    
    // Octant 2 & 6
    if ((m > 1 || m < -1)) {
        float t = y1;
        y1 = x1;
        x1 = t;
    };

    if (x0 > x1) { // Account for the other 4 octants.
        float t = x1;
        x1 = x0;
        x0 = t;

        t = y1;
        y1 = y0;
        y0 = t;
    }

    //Octant 4 & 8
    if (m < 0 && m >= -1) y1 = y0 + (y0-y1);
    
    // Main Alg
    float a = -1 * (y1 - y0);
    float b = (x1 - x0);
    float c = x0 * y1 - x1 * y0;

    int x = round(x0);
    int xr = round(x1);
    int y = round((-1 * a * x - c)/b);

    int yi = round(y0);

    // If it's a straight line... there's no point in doing all the y calculations.
    // Only works if axis aligned.    
    if (m == 0) { while(x <= xr) { point(x, y); x += 1; } return; }

    float k = a * (x + 1) + b * (y + 1/2) + c;

    // print("M: " + m + "Origin: (" + x0 + ", " + y0 + "), End: (" + x1 + ", " + y1 + ")\n");

    while(x <= xr) {
        if (m <= 1 && m >= 0) point(x, y);                  // Oct 1 & 5
        else if (m < 0 && m >= -1) point(x, yi + (yi - y)); // Oct 4 & 8
        else if (m < -1) point(y, xi + (xi - x));           // Oct 3 & 7
        else point(y, x);                                   // Oct 2 & 6
        
        if (k > 0) { k = k + a; }                           // East
        else { k = k + a + b; y += 1; }                     // North East

        x += 1;                                             // Next Pixel
    }
}

void draw(){
    clear();    
    background(background);

    // stroke(255, 0, 0);
    // line(100, 100, mouseX, mouseY);
    stroke(0, 0, 0);
    myLine(100, 100, mouseX, mouseY);

    // // oct 1 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 200, 170);
    // stroke(0, 0, 0);
    // myLine(100, 100, 200, 170);
    // // oct 2 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 150, 200);
    // stroke(0, 0, 0);
    // myLine(100, 100, 150, 200);
    // // oct 3 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 50, 200);
    // stroke(0, 0, 0);
    // myLine(100, 100, 50, 200);
    // // oct 4 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 0, 170);
    // stroke(0, 0, 0);
    // myLine(100, 100, 0, 170);
    // // oct 5 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 0, 70);
    // stroke(0, 0, 0);
    // myLine(100, 100, 0, 70);
    // // oct 6 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 70, 0);
    // stroke(0, 0, 0);
    // myLine(100, 100, 70, 0);
    // // oct 7 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 150, 0);
    // stroke(0, 0, 0);
    // myLine(100, 100, 150, 0);
    // //oct 8 [X]
    // stroke(255, 0, 0);
    // line(100, 100, 200, 70);
    // stroke(0, 0, 0);
    // myLine(100, 100, 200, 70);
}
