// Abstract class to achieve closer functionality to actual java enums.
static abstract class AnimationCycle {
    static final String IDLE = "IDLE";
    static final String RUN = "RUN";
    static final String JUMP = "JUMP";
}

class Player implements GamePart {
    // Player Properties
    private float playerWidth;
    private float playerHeight;

    // Player physics fields.
    private Vector2D position;
    private Vector2D velocity;
    private boolean midAir;

    // Player animation fields.
    private Animator animator;                   // Manages animation sequences.
    private String currentAnimation;             // The currently playing animation.
    private boolean animationLock;               // Lock an animation as unchangable.
    private int animationLockTimer;              // Duration for a locked animation to play.
    private boolean facingBack;                  // true = facing left

    // Properties functions.
    public float x() { return position.x(); }
    
    public float y() { return position.y(); }

    // On Creation of Player.
    public Player() {
        // Set properties and starting location.
        playerWidth = 25;
        playerHeight = 65;
        position = new Vector2D(width / 2, height - playerHeight);
        velocity = new Vector2D(0.0f, 0.0f);
        midAir = false;

        // Add players possible animations.
        animator = new Animator();
        animator.setAnimationSpeed(5);
        animator.add(AnimationCycle.IDLE, "idle.png", 22, 32, 6, 2);
        animator.add(AnimationCycle.RUN, "run.png", 25, 34, 8, 2);
        animator.add(AnimationCycle.JUMP, "jump.png", 30, 35, 10, 2);

        // Preset player to begin in idle-right animation on first draw.
        currentAnimation = AnimationCycle.IDLE;
        animationLock = false;
        animationLockTimer = 0;
        facingBack = false;
    }

    // Set player as open to beginning new animations.
    void unlockAnimation() {
        animationLock = false;
    }

    // Movement for the player. Set velocity to move x or -x.
    public void moveLeft() {
        currentAnimation = AnimationCycle.RUN;
        velocity = new Vector2D(-MAXVELOCITY, velocity.y());

        facingBack = true;
    }

    public void moveRight() {
        currentAnimation = AnimationCycle.RUN;
        velocity = new Vector2D(MAXVELOCITY, velocity.y());

        facingBack = false;
    }

    // Add a vertial impulse and then lock in the JUMP animation cycle.
    public void jump() {
        if (midAir) return;
        midAir = true;
        animationLock = true;
        velocity = velocity.add(0.0f, -10.0f);

        currentAnimation = AnimationCycle.JUMP;
        animationLockTimer = animator.getLength(AnimationCycle.JUMP);
    }

    // On update of Player.
    public void update() {
        animationLockTimer--;
        if (position.y() + playerHeight < height) velocity = velocity.add(0, 1);
        else if (position.y() + playerHeight > height) {
            velocity = new Vector2D(velocity.x(), 0.0f);
            position = new Vector2D(position.x(), height - playerHeight);
        }
        position = position.add(velocity);

        // We aren't using keyReleased in this case so we check each frame if a key is
        // still pressed and reset velocity to zero and IDLE animation if needed.
        if (!keyPressed) { 
            velocity.zeroX();
            if (!animationLock) currentAnimation = AnimationCycle.IDLE;
            if (animationLockTimer <= 0) { 
                unlockAnimation(); 
                midAir = false; 
            }
        }
    }

    // On draw of Player.
    public void draw() {
        // Draw player dependant on where camera is.
        pushMatrix();
            // Flip player if facing backwards.
            translate(position.x() - CAMERA.x(), position.y() - CAMERA.y());
            scale(facingBack ? -1 : 1, 1);
            
            image(animator.nextFrame(currentAnimation), facingBack ? -animator.getWidth(currentAnimation) : 0, 0);
        popMatrix();
    }
}