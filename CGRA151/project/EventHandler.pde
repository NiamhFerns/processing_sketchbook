// Overarching types for EventStates so that the EventHandler can be interacted with.
public enum EventStates {
    MENU,
    GAMEPLAY,
    PIECE_SELECTED
}

// Any Event state should implement methods that allow for key and mouse interaction
// as well as retreiving a name and a type.
interface EventHandlerState {
    void actionMouse();
    void actionKey(int code);
    void releaseKey(int code);
    String getName();
    EventStates type();
}

// ----------------------------------------------------------------------------
//                                EVENT STATES
// ----------------------------------------------------------------------------

// Input handling for Menus in game (both menu screen and popup menus).
// Conceptually acts as an overlay for other elements.
private class StateMenu implements EventHandlerState {
    void actionMouse() {
        GAME.menu.getClickable().run();
    }
    
    void actionKey(int code) {
        switch(code) {
            case 27: // Hide the menu or quit on <ESC> in a menu screen.
                if(GAME.menu.getName() == "PauseMenu") {
                    EVENTS.setState(EventStates.GAMEPLAY);
                    GAME.menu.setVisible(false);
                    break;
                }
                exit();
                break;

            default:
                break;
        }
    }
    
    void releaseKey(int code) {}

    String getName() {
        return "MENU";
    }

    public EventStates type() { return EventStates.MENU; }

    public String menuName() { return GAME.menu.getName(); }
}

// Input handling for gameplay. Translates actions to interact with the board.
private class StateGameOverview implements EventHandlerState {
    void actionMouse() {
        GAME.board.selectPiece();
    }
    
    void actionKey(int code) { 
        switch(code) {
            case 27: // Show menu on <ESC> during gameplay.
                EVENTS.setState(EventStates.MENU);
                GAME.menu.setVisible(true);
                break;

            default:
                break;
        }
    }

    void releaseKey(int code) { print("Hello Release."); }
    
    String getName() {
        return "GAMEPLAY";
    }
    
    public EventStates type() { return EventStates.GAMEPLAY; }
}

// Input handling for moving a piece around the board. Conceptually acts as an 'overlay' for StateGameplay
private class StateGameMove implements EventHandlerState {
    void actionMouse() {
        GAME.board.movePiece();
    }
    
    void actionKey(int code) {}
    
    void releaseKey(int code) {}
    
    String getName() {
        return "PIECE_SELECTED";
    }
    
    public EventStates type() { return EventStates.PIECE_SELECTED; }
}

// ----------------------------------------------------------------------------
//                                EVENT HANDLER
// ----------------------------------------------------------------------------

// The main Event handler. Any keypreses are passed to this and are then sent to the appropriate place.
class EventHandler {
    EventHandlerState evState;
    boolean currentTurn;
    int turnNumber;
    int moveNumber;

    // This allows other parts of the program to set the game state. Ideally this would be only used by
    // menus and or major game events (checkmate, etc).
    void setState(EventStates state) {
        switch(state) {
            case MENU:
                evState = new StateMenu();
                break;

            case GAMEPLAY:
                evState = new StateGameOverview();
                break;
            
            case PIECE_SELECTED:
                evState = new StateGameMove();
                break;
            
            default :
                break;	
        }
    } 

    // Returns the current state.
    public EventStates currentState() {
        return evState.type();
    }

    // Returns whether the current turn matches the piece colour you want.
    public boolean getTurn(boolean pieceColour) {
        return pieceColour == currentTurn;
    }

    // Returns the current turn in general.
    public boolean getCurrentTurn() {
        return currentTurn;
    }

    // Sets the game to move to the next turn.
    public void turnOver() {
        if (currentTurn) turnNumber++;
        moveNumber++;
        currentTurn = !currentTurn;
    } 

    // Resets the event handler to start from turn one and white.
    public void resetMoves() {
        currentTurn = false;
        turnNumber = 1;
        moveNumber = 1;
    }

    // Receive any inputs from the official key/mouse methods.
    void mouseClicked() {
        evState.actionMouse();
    }

    void keyPressed(int code) {
        evState.actionKey(code);
    }

    void keyReleased(int code) {
        evState.releaseKey(code);
    }

    // Only one event handler needs to be present.
    EventHandler() {
        setState(EventStates.MENU);
        currentTurn = false;
        turnNumber = 1;
        moveNumber = 1;
    }
}