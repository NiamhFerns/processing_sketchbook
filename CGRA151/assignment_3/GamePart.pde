// GamePart represents an entity in our game. Each entity should have a
// draw and an update method so the game can interact with it.
public interface GamePart {
    void update();
    void draw();
}