class Animator {
    private HashMap<String, PImage[]> animations;

    private String currentlyPlaying;         // The currently playing animation.
    private int animationLength;             // The amount of frames in an animation.
    private int frameOffset;                 // Amount to offset to start playback from zero frame.
    private int animSpeed;                   // Higher == slower speed.

    public Animator() {
        animations = new HashMap<String, PImage[]>();
        currentlyPlaying = "[EMPTY]";
        // animationIndex = 0;
        animationLength = 0;
        frameOffset = 0;
        animSpeed = 1;
    }

    // Add a named animation segmented by consistently sized frame widths and heights.
    public void add(String name, String spriteMapPath, int frameWidth, int frameHeight, int frames, int scale) {
        PImage spriteMap = loadImage(spriteMapPath);
        
        // Animations stored in map that can be referenced to grab the next frame.
        animations.put(name, new PImage[frames]);
        for(int i = 0; i < frames; i++) {
            animations.get(name)[i] = spriteMap.get(frameWidth * i, 0, frameWidth, frameHeight);
            animations.get(name)[i].resize(frameWidth * scale, frameHeight * scale);
        }
    }

    // Returns length of a set animation.
    public int getLength(String name) {
        return animations.get(name).length * animSpeed;
    }

    // Returns frame width of a single sprite in an animation
    public int getWidth(String name) {
        return animations.get(name)[0].width;
    }

    // Set the animation speed.
    public void setAnimationSpeed(int speed) {
        animSpeed = speed;
    }
    
    // Grab the next frame in an animation starting from 0 if different animation animation.
    public PImage nextFrame(String name) {
        // Next frame if this is the current animation continued.
        if (name.equals(currentlyPlaying))
            // (frameCount / animFrameRate) - frameOffset makes sure we continue on the animation from the correct spot.
            // frameOffset being the distance we were from starting from frame zero.
            return animations.get(name)[((frameCount / animSpeed) - frameOffset) % animationLength];

        // Starting frame if this is a different animation.
        currentlyPlaying = name;
        animationLength = animations.get(name).length;
        // We find the frame off set that we need to use make sure the animation starts/continues from frame 0 start.
        frameOffset = (frameCount / animSpeed) % animationLength;
        return animations.get(name)[0];
    }
}