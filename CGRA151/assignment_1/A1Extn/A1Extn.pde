ArrayList<Line> lines = new ArrayList<Line>();
Consts consts = new Consts();
Maths maths = new Maths();
int frame = 0;


void setup() {
    size(640, 480);    
    background(0x181825);
    lines.add(new Line());
    frameRate(120);
}

void update() {
    // Go through each line and call it's move function.
    for (Line l : lines) {
        l.move();
    }

    // 1% chance of spawning a new line.
    if (maths.rChance(1)) {
        lines.add(new Line());
    }
}

void draw() {
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