class Line {
    int x, y, directionX, directionY;
    color lineColour;
    boolean axis, lastMoved;

    void move() {

        // 2% chance of changing the axis that the line is moving on
        if (maths.rChance(2.0)) axis = !axis;
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
        if (lastMoved) directionY = maths.rChance(5.0) ? 1 : -1;
        else directionX = maths.rChance(5.0) ? 1 : -1;
    }

    void draw() {
        fill(lineColour);
        noStroke();

        // The one shape. c:
        ellipse(x, y, consts.lineWidth * 2, consts.lineWidth * 2);
    }

    Line() {
        x = int(random(0, width));
        y = int(random(0, height));

        directionX = maths.rBool() ? 1 : -1;
        directionY = maths.rBool() ? 1 : -1;
        axis = maths.rBool();
        lineColour = consts.colors[int(random(0, consts.colors.length))];
    }
}