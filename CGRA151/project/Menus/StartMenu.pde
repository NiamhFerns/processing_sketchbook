private class StateMenu implements EventHandlerState {
    void actionMouse() {
        GAME.menu.getClickable().run();
    }
    void actionKey(int code) {
        switch(code) {
            case 27: // Escape Key.
                if(EVENTS.currentState() == EventStates.START_MENU) {
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
}