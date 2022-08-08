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
        if (cornerCollision) { print( "Velocity Before: (" + velocity.x + ", " + velocity.y + ")!\n"); velocity.invert(); print("Velocity After: (" + velocity.x + ", " + velocity.y + ")!\n"); return; }
        if (nextX() <= rt.getX() || nextX() >= rt.getX() + rt.getWidth()) { velocity.invertX(); return; }
        if (nextY() <= rt.getY() || nextY() >= rt.getY() + rt.getHeight()) { velocity.invertY(); return; }
    }

    private void checkCollisions() {
        // Walls
        if (nextX() + radius > width || nextX() - ball.radius < 0) velocity.invertX();
        if (nextY() + radius > height || nextY() - ball.radius < 0) velocity.invertY();

        Vector2D rToBat = new Vector2D(0.0, 0.0);
        rayToRect(bat, rToBat);

        // We only want one collision event. This is a very niave way of handling this issue and it doesn't fix the issue of hitting the ball in the direction it is already travelling in.
        // To fix this more thoroughly I'd need to have someway to have a vector distance that the centre of the ball is *into* the bat and then move the ball along that vector as well as
        // by the velocity already set. I'd also need to be able to some how detect if the ball is travelling downward when it hits the bottomside and only reflect it if it is travelling 
        // up when it hits the bottom, down when it hits the top, etc etc.
        if (rToBat.norm() <= radius && free) { collidesWith(bat); free = false; }
        else if (rToBat.norm() > radius) free = true;

        for (int y = 0; y < 4; ++y) {
            for (int x = 0; x < 8; ++x) {
                if (tiles[y][x] != null) {
                    rayToRect(tiles[y][x], rToBat);
                    if(rToBat.norm() <= radius) { 
                        tiles[y][x].update();
                        collidesWith(tiles[y][x]); 
                        if (tiles[y][x].lives <= 0) tiles[y][x] = null;
                    }
                }
            }
        }
    }

    public void update() {
        checkCollisions();
        move(velocity);
    }

    public Ball(Vector2D position, float r, Vector2D velocity) {
        super(position, r);
        this.velocity = velocity;
        currentColor = color(242, 205, 205);
    }
}