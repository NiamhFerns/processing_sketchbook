// Abstract class to achieve closer functionality to actual java enums.
static abstract class AnimationCycle {
    static final String IDLE_RIGHT = "IDLE RIGHT";
    static final String IDLE_LEFT = "IDLE LEFT";
    static final String RUN_RIGHT = "RUN RIGHT";
    static final String RUN_LEFT = "RUN LEFT";
    static final String JUMP_RIGHT = "JUMP RIGHT";
    static final String JUMP_LEFT = "JUMP LEFT";
}

class Player implements GamePart {
    Vector2D position;
    Vector2D velocity;

    Animator animator;
    String currentAnimation;

    float playerWidth;
    float playerHeight;

    boolean animationLock;
    int animationLockTimer;
    boolean facingBack;

    public float x() { return position.x(); }
    public float y() { return position.y(); }

    // On Creation of Player.
    public Player() {
        playerWidth = 24;
        playerHeight = 52;
        position = new Vector2D(width / 2, height / 2);
        velocity = new Vector2D(0.0f, 0.0f);

        animator = new Animator();

        animator.add(AnimationCycle.IDLE_LEFT, "idle_l.png", 22, 32, 6, 2);
        animator.add(AnimationCycle.IDLE_RIGHT, "idle_r.png", 22, 32, 6, 2);

        animator.add(AnimationCycle.JUMP_LEFT, "jump_l.png", 30, 35, 10, 2);
        animator.add(AnimationCycle.JUMP_RIGHT, "jump_r.png", 30, 35, 10, 2);

        animator.add(AnimationCycle.RUN_LEFT, "run_l.png", 25, 34, 8, 2);
        animator.add(AnimationCycle.RUN_RIGHT, "run_r.png", 25, 34, 8, 2);

        currentAnimation = AnimationCycle.IDLE_RIGHT;
        animationLock = false;
        animationLockTimer = 0;
        facingBack = false;
    }

    void lockAnimation(String animationKey) { 
        animationLock = true;
        currentAnimation = animationKey;

        animationLockTimer = animator.getLength(animationKey);
    }

    void unlockAnimation() {
        animationLock = false;
    }

    // Movement for the player. Set velocity to move x or -x.
    public void moveLeft() {
        currentAnimation = AnimationCycle.RUN_LEFT;
        velocity = new Vector2D(-MAXVELOCITY, velocity.y());

        facingBack = true;
    }

    public void moveRight() {
        currentAnimation = AnimationCycle.RUN_RIGHT;
        velocity = new Vector2D(MAXVELOCITY, velocity.y());

        facingBack = false;
    }

    public void jump() {
        if (facingBack) {
            lockAnimation(AnimationCycle.JUMP_LEFT);
            return;
        }
        lockAnimation(AnimationCycle.JUMP_RIGHT);
    }

    public void setIdle() {
        if (facingBack) {
            currentAnimation = AnimationCycle.IDLE_LEFT;
            return;
        }
        currentAnimation = AnimationCycle.IDLE_RIGHT;
    }

    // On update of Player.
    public void update() {
        animationLockTimer--;
        position = position.add(velocity);

        // We aren't using keyReleased in this case so we check each frame if a key is
        // still pressed and reset velocity to zero if not.
        if (!keyPressed) { 
            velocity.zeroX();
            if (!animationLock) setIdle();
            if (animationLockTimer <= 0) unlockAnimation();
        }
    }

    // On draw of Player.
    public void draw() {
        fill(0);
        // Draw player dependant on where camera is.
        // rect(position.x() - CAMERA.x(), position.y() - CAMERA.y(), playerWidth, playerHeight);
        image(animator.nextFrame(currentAnimation), position.x() - CAMERA.x(), position.y() - CAMERA.y());
    }
}