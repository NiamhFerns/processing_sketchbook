interface EventHandlerState {
    void action();
}

private class StateMenu implements EventHandlerState {
    void action() {
        print("Hello!");
    }
}

private class StateGameOverview implements EventHandlerState {
    void action() {}
}

private class StateGameMove implements EventHandlerState {
    void action() {}
}

class EventHandler {
    EventHandlerState evState; 

    // Effected by state
    void mouseClicked() {
        evState.action();
    }

    // NOT Effected by state.
    EventHandler() {
        evState = new StateMenu();
    }
}