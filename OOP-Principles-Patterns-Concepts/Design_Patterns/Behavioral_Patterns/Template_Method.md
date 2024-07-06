# Template Method
**Definition:** The Template Method Pattern defines the skeleton of an algorithm in a method, deferring some steps to subclasses. Template Method lets subclasses redefine certain steps of an algorithm without changing the algorithms structure.

**Example:**
\`\`\`java
abstract class Game {
    abstract void initialize();
    abstract void startPlay();
    abstract void endPlay();

    // template method
    public final void play() {
        initialize();
        startPlay();
        endPlay();
    }
}

class Cricket extends Game {
    @Override
    void initialize() {
        System.out.println("Cricket Game Initialized.");
    }

    @Override
    void startPlay() {
        System.out.println("Cricket Game Started.");
    }

    @Override
    void endPlay() {
        System.out.println("Cricket Game Finished.");
    }
}

class Football extends Game {
    @Override
    void initialize() {
        System.out.println("Football Game Initialized.");
    }

    @Override
    void startPlay() {
        System.out.println("Football Game Started.");
    }

    @Override
    void endPlay() {
        System.out.println("Football Game Finished.");
    }
}
\`\`\`

