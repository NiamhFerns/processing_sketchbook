public enum OptionalComponents {
    TIMER,
    AI,
    BOARD_ROTATION
}

public class OptionalComponentsHandler {
    private HashMap<OptionalComponents, Component> components;

    public OptionalComponentsHandler() {
        components = new HashMap<OptionalComponents, Component>();
        components.put(OptionalComponents.TIMER, new TimerComponent());
        components.put(OptionalComponents.AI, new AIComponent());
        components.put(OptionalComponents.BOARD_ROTATION, new BoardRotationComponent());
    }

    public void reset() {
        for (Component c : components.values()) {
            c.reset();
        }
    }

    public ArrayList<Component> get() {
        ArrayList<Component> features = new ArrayList<Component>();
        for (Component c : components.values()) {
            if (c.isActive()) features.add(c);
        }
        return features;
    }

    public boolean getStatus(OptionalComponents c) {
        return components.get(c).isActive();
    }

    public void toggle(OptionalComponents c) {
        components.get(c).toggleActive();
    }
}

public abstract class Component implements GamePart {
    private boolean active;
    public final void toggleActive() { active = !active; }
    public final boolean isActive() { return active; }

    public void reset() {

    }

    public Component() {
        active = false;
    }

    public abstract void update();
    public abstract void draw();
}

class TimerComponent extends Component {
    Pair<Integer, Integer> format;
    long startTime;
    long timeRemainingBlack;
    long timeRemainingWhite;
    PImage[] clock;

    public TimerComponent() {
        format = new Pair<Integer, Integer>(300000, 0);
        timeRemainingBlack = format.key();
        timeRemainingWhite = format.key();
        clock = new PImage[8];
        PImage clockSheet = loadImage("textures/clock.png");
        for (int i = 0; i < 8; ++i) {
            clock[i] = clockSheet.get(0 + (i * clockSheet.height), 0, clockSheet.height, clockSheet.height);
            clock[i].resize(96, 96);
        }
    }

    public void reset() {
        timeRemainingBlack = format.key();
        timeRemainingWhite = format.key();
    }

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

    private String readableTime(long millis) {
        String minutes = (millis / 1000) / 60 + ":";
        if (minutes.length() < 3) minutes = "0" + minutes;
        String seconds = (millis / 1000) % 60 + "";
        if (seconds.length() < 2) seconds = "0" + seconds;
        return minutes + seconds;
    }
}
class AIComponent extends Component {
    public void update() {}
    public void draw() {}
}
class BoardRotationComponent extends Component {
    private boolean rotated;
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