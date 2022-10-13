// Basically just a runnable that I can use whereever.
interface Executable{
    void run();
}

// Exectutable with no action.
class EMPTY_EXECUTABLE implements Executable {
    public void run() { }
}