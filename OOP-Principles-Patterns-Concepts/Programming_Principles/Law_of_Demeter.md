# Law of Demeter (Principle of Least Knowledge)
**Definition:** The Law of Demeter is a design guideline for developing software, particularly object-oriented programs. In its general form, the LoD is a specific case of loose coupling.

**Example:**
\`\`\`java
class Engine {
    public void start() {
        // Start the engine
    }
}

class Car {
    private Engine engine;

    public Car() {
        engine = new Engine();
    }

    public void start() {
        engine.start();
    }
}
\`\`\`

