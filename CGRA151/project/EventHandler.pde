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
    void actionMouse() {}
    
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
    void actionMouse() {}
    
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

    // This allows other parts of the program to set the game state. Ideally this would be only used by
    // menus and or major game events (checkmate, etc).
    void setState(EventStates state) {
        switch(state) {
            case MENU:
                print("[EVENT] STATE SWITCH: [" + (evState == null ? "NONE" : evState.getName()) + "] -> [MENU]\n");
                evState = new StateMenu();
                break;

            case GAMEPLAY:
                print("[EVENT] STATE SWITCH: [" + (evState == null ? "NONE" : evState.getName()) + "] -> [GAMEPLAY]\n");
                evState = new StateGameOverview();
                break;
            
            case PIECE_SELECTED:
                print("[EVENT] STATE SWITCH: [" + (evState == null ? "NONE" : evState.getName()) + "] -> [PIECE_SELECTED]\n");
                evState = new StateGameMove();
                break;
            
            default :
                print("[EVENT WARNING] STATE SWITCH: NOT A VALID STATE!");    
                break;	
        }
    } 

    public EventStates currentState() {
        return evState.type();
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
    }
}