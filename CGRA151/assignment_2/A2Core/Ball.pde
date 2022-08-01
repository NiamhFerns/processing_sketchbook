class Ball extends Circle {
    Vector2D velocity;
    boolean free = true;

    public float nextX()      { return position.x + velocity.x * dt; }
    public float nextY()      { return position.y + velocity.y * dt; }
    public Vector2D nextPos() { return new Vector2D(velocity);       }

    private void rayToRect(Rectangle rt, Vector2D ray) {
        Vector2D activeEdge = new Vector2D(0.0f, 0.0f);
        activeEdge.x = max(rt.getX(), min(rt.getX() + rt.getWidth(), (int)nextX()));
        activeEdge.y = max(rt.getY(), min(rt.getY() + rt.getHeight(), (int)nextY()));

        ray.x = activeEdge.x - (float)nextX();
        ray.y = activeEdge.y - (float)nextY();

        // Debugging to draw the ray if needed.
        // line(activeEdge.x, activeEdge.y, nextX(), nextY());
    }

    private void collidesWith(Rectangle rt) {
        // Will only be true it fhe ball is approaching from a corner.
        boolean cornerCollision =  (nextX() <= rt.getX() || nextX() >= rt.getX() + rt.getWidth())   // The ball is to the left or right of the bat.
                                && (nextY() <= rt.getY() || nextY() >= rt.getY() + rt.getHeight()); // The ball is above or bellow the bat.

        // Yes I know this is gross. I ran out of time to refactor it to not be gross. ;-;
        if (cornerCollision) { velocity.reflect(); return; }
        if (nextX() <= rt.getX() || nextX() >= rt.getX() + rt.getWidth()) velocity.invertX();
        if (nextY() <= rt.getY() || nextY() >= rt.getY() + rt.getHeight()) velocity.invertY();

        print("Collision!\n");
    }

    private void checkCollisions() {
        // Walls
        if (nextX() + radius > width || nextX() - ball.radius < 0) velocity.invertX();
        if (nextY() + radius > height || nextY() - ball.radius < 0) velocity.invertY();

        Vector2D rToBat = new Vector2D(0.0, 0.0);
        rayToRect(bat, rToBat);

        // We only want one collision event.
        if (rToBat.norm() <= radius && free) { collidesWith(bat); free = false; }
        else if (rToBat.norm() > radius) free = true;
    }

    public void update() {
        checkCollisions();
        move(velocity);
    }

    public Ball(Vector2D position, float r, Vector2D velocity) {
        super(position, r);
        this.velocity = velocity;
    }
}