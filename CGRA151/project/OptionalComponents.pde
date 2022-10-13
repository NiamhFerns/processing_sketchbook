// Possible components that can be added at runtime by player.
public enum OptionalComponents {
    TIMER,
    BOARD_ROTATION
}

// API responsible for handling any actions to do with optional features for the game.
public class OptionalComponentsHandler {
    private HashMap<OptionalComponents, Component> components;

    // All our optional features live in a hashmap that can be querried by the wider program.
    public OptionalComponentsHandler() {
        components = new HashMap<OptionalComponents, Component>();
        components.put(OptionalComponents.TIMER, new TimerComponent());
        components.put(OptionalComponents.BOARD_ROTATION, new BoardRotationComponent());
    }

    // Resets all optional components to let them know a fresh round has begun.
    public void reset() {
        for (Component c : components.values()) {
            c.reset();
        }
    }

    // Retreive a list of activated components that can be updated and drawn.
    public ArrayList<Component> get() {
        ArrayList<Component> features = new ArrayList<Component>();
        for (Component c : components.values()) {
            if (c.isActive()) features.add(c);
        }
        return features;
    }

    // Retreive the status for a specific component. True if active false if not.
    public boolean getStatus(OptionalComponents c) {
        return components.get(c).isActive();
    }

    // Toggles the status of a component if it's wanted/unwanted.
    public void toggle(OptionalComponents c) {
        components.get(c).toggleActive();
    }
}

public abstract class Component implements GamePart {
    private boolean active;
    public final void toggleActive() { active = !active; }
    public final boolean isActive() { return active; }

    // Default reset method does nothing.
    public void reset() {}

    // Defaults components to not activated. 
    public Component() {
        active = false;
    }

    public abstract void update();
    public abstract void draw();
}

// Adds a timer for each player to make the game rapid chess.
class TimerComponent extends Component {
    Pair<Integer, Integer> format;
    long startTime;
    long timeRemainingBlack;
    long timeRemainingWhite;
    PImage[] clock;

    public TimerComponent() {
        // We instantiate the standard format for a rapid chess game (5 minuts per player per round with no added time per turn.)
        format = new Pair<Integer, Integer>(300000, 0);

        timeRemainingBlack = format.key();
        timeRemainingWhite = format.key();
        
        // Grab our clock texture and load it's animation.
        clock = new PImage[8];
        PImage clockSheet = loadImage("textures/clock.png");
        for (int i = 0; i < 8; ++i) {
            clock[i] = clockSheet.get(0 + (i * clockSheet.height), 0, clockSheet.height, clockSheet.height);
            clock[i].resize(96, 96);
        }
    }

    // Reset time to whatever is defined in the format.
    public void reset() {
        timeRemainingBlack = format.key();
        timeRemainingWhite = format.key();
    }

    // Every tick we reduce by the passed time on the current players turn.
    public void update() {
        if (EVENTS.getCurrentTurn())
            timeRemainingBlack -= LAST_FRAME_TIME;
        else
            timeRemainingWhite -= LAST_FRAME_TIME;
        
        if (timeRemainingBlack <= 0) GAME.onGameEnd("TIME VICTORY", "White");
        if (timeRemainingWhite <= 0) GAME.onGameEnd("TIME VICTORY", "Black");
    }

    public void draw() {
        fill(255);
        textSize(24);
        textAlign(CENTER, CENTER);
        text("Black - " + readableTime(timeRemainingBlack), 400 - 200, height - 100);
        text("White - " + readableTime(timeRemainingWhite), 400 + 200, height - 100);
        imageMode(CENTER);
        image(clock[frameCount / 60 % 8], 400, height - 100);
        imageMode(CORNER);
    }

    // Retreives the current time remaining in a human readable format. (mm:ss)
    private String readableTime(long millis) {
        String minutes = (millis / 1000) / 60 + ":";
        if (minutes.length() < 3) minutes = "0" + minutes;
        String seconds = (millis / 1000) % 60 + "";
        if (seconds.length() < 2) seconds = "0" + seconds;
        return minutes + seconds;
    }
}

// Rotates the board so that the current player's pieces are always on the bottom.
class BoardRotationComponent extends Component {
    private boolean rotated;

    // Rotate the board if the current turn and rotation values don't match up.
    // A rotated board will always have black on bottom as black goes second.
    public void update() {
        if ((EVENTS.getTurn(false) && rotated) || (EVENTS.getTurn(true) && !rotated)) {
            GAME.board.rotateBoard();
            rotated = !rotated;
        }
    }
    public void draw() {}

    public BoardRotationComponent() {
        rotated = false;
    }
}