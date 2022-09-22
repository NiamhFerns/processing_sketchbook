public enum EventStates {
    START_MENU,
    GAMEPLAY,
    PIECE_SELECTED
}

interface EventHandlerState {
    void actionMouse();
    void actionKey(int code);
    void releaseKey(int code);
    String getName();
    EventStates type();
}

private class StateMenu implements EventHandlerState {
    void actionMouse() {
        GAME.menu.getClickable().run();
    }
    void actionKey(int code) {
        switch(code) {
            case 27: // Escape Key.
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
        return "START_MENU";
    }

    public EventStates type() { return EventStates.START_MENU; }

    public String menuName() { return GAME.menu.getName(); }
}

private class StateGameOverview implements EventHandlerState {
    void actionMouse() {}
    void actionKey(int code) { 
        switch(code) {
            case 27: // Escape Key.
                EVENTS.setState(EventStates.START_MENU);
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

private class StateGameMove implements EventHandlerState {
    void actionMouse() {}
    void actionKey(int code) {}
    void releaseKey(int code) {}
    
    String getName() {
        return "PIECE_SELECTED";
    }
    public EventStates type() { return EventStates.PIECE_SELECTED; }
}

class EventHandler {
    EventHandlerState evState;

    void setState(EventStates state) {
        switch(state) {
            case START_MENU:
                print("[EVENT] STATE SWITCH: [" + (evState == null ? "NONE" : evState.getName()) + "] -> [START_MENU]\n");
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

    // Effected by state
    void mouseClicked() {
        evState.actionMouse();
        // setState(EventStates.GAMEPLAY);
    }

    void keyPressed(int code) {
        evState.actionKey(code);
    }

    void keyReleased(int code) {
        evState.releaseKey(code);
    }

    // NOT Effected by state.
    EventHandler() {
        setState(EventStates.START_MENU);
    }
}