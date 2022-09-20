class Animator {
    HashMap<String, PImage[]> animations;
    String currentlyPlaying;
    int animationLength;

    public Animator() {
        animations = new HashMap<String, PImage[]>();
        currentlyPlaying = "[EMPTY]";
        // animationIndex = 0;
        animationLength = 0;
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

    public int getLength(String name) {
        return animations.get(name).length * 3;
    }
    
    // Grab the current frame based on the currently playing animation and the current animation index.
    // public PImage currentFrame() {
    //     return animations.get(currentlyPlaying)[animationIndex];
    // }

    // Grab the next frame in an animation starting from 0 if different animation animation.
    public PImage nextFrame(String name) {
        // Next frame if this is the current animation continued.
        if (name.equals(currentlyPlaying))
            return animations.get(name)[(frameCount / 3) % animationLength];

        // Starting frame if this is a different animation.
        currentlyPlaying = name;
        animationLength = animations.get(name).length;
        return animations.get(name)[0];
    }
}