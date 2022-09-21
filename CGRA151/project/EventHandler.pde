public enum EventStates {
    START_MENU,
    GAMEPLAY,
    PIECE_SELECTED
}

interface EventHandlerState {
    void action();
    String getName();
}

private class StateMenu implements EventHandlerState {
    void action() {
        GAME.menu.getClickable().run();
    }

    String getName() {
        return "START_MENU";
    }
}

private class StateGameOverview implements EventHandlerState {
    void action() {}
    
    String getName() {
        return "GAMEPLAY";
    }
}

private class StateGameMove implements EventHandlerState {
    void action() {}
    
    String getName() {
        return "PIECE_SELECTED";
    }
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

    // Effected by state
    void mouseClicked() {
        evState.action();
        // setState(EventStates.GAMEPLAY);
    }

    // NOT Effected by state.
    EventHandler() {
        setState(EventStates.START_MENU);
    }
}