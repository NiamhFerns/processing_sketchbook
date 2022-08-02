color background = color(255, 255, 255);

void setup() {
    size(200, 200);
    
    noLoop();
    noSmooth();
}

private void myLine(float x0, float y0, float x1, float y1) {
    float m = (y1 - y0) / (x1 - x0);
    // Octant 1 & 5
    if ((m >= 0 && m <= 1)) {
        // Octant 5 is just octant 1 with the line drawn from end to beginning.
        if (x0 > x1) {
            float t = x0; x0 = x1; x1 = t;
            t = y0; y0 = y1; y1 = t;
        }
    };

    // Octant 2 & 6
    if ((m > 1)) print("Octant 2!\n");
    // Octant 3 & 7
    if ((m < 0 && m >= -1)) print("Octant 3!\n");
    // Octant 4 & 8
    if ((m < -1)) print("Octant 4!\n");

    // Main Alg
    float a = -1 * (y1 - y0);
    float b = (x1 - x0);
    float c = x0 * y1 - x1 * y0;
    int x = round(x0);
    int xr = round(x1);
    int y = round((-1 * a * x - c)/b);

    // If it's a straight line... there's no point in doing all the y calculations.
    // Only works if axis aligned.    
    if (m == 0) {
        while(x <= xr) {
            point(x, y);
            x += 1;
        }
        return;
    }

    float k = a * (x + 1) + b * (y + 1/2) + c;

    while(x <= xr) {
        point(x, y);
        if (k > 0) { k = k + a; }
        else       { k = k + a + b; y += 1; }

        x += 1;
    }
}

void draw(){
    clear();    
    background(background);

    // 0 deg
    // stroke(255, 0, 0);
    // line(100, 100, 200, 100);
    // stroke(0, 0, 0);
    // myLine(100, 100, 200, 100);
    
    // oct 1
    stroke(255, 0, 0);
    line(100, 100, 200, 170);
    stroke(0, 0, 0);
    myLine(100, 100, 200, 170);
    // oct 2
    stroke(255, 0, 0);
    line(100, 100, 150, 200);
    stroke(0, 0, 0);
    myLine(100, 100, 150, 200);
    // oct 3
    stroke(255, 0, 0);
    line(100, 100, 50, 200);
    stroke(0, 0, 0);
    myLine(100, 100, 50, 200);
    // oct 4
    stroke(255, 0, 0);
    line(100, 100, 0, 170);
    stroke(0, 0, 0);
    myLine(100, 100, 0, 170);
    // oct 5
    stroke(255, 0, 0);
    line(100, 100, 0, 70);
    stroke(0, 0, 0);
    myLine(100, 100, 0, 70);
    // oct 6
    stroke(255, 0, 0);
    line(100, 100, 70, 0);
    stroke(0, 0, 0);
    myLine(100, 100, 70, 0);
    // oct 7
    stroke(255, 0, 0);
    line(100, 100, 150, 0);
    stroke(0, 0, 0);
    myLine(100, 100, 150, 0);
    // oct 8
    stroke(255, 0, 0);
    line(100, 100, 200, 70);
    stroke(0, 0, 0);
    myLine(100, 100, 200, 70);
}