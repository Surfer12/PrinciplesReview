# Composition over Inheritance
**Definition:** Composition over inheritance is a principle that suggests using composition instead of inheritance to achieve code reuse.

**Example:**
\`\`\`java
class Engine {
    public void start() {
        System.out.println("Engine started");
    }
}

class Car {
    private Engine engine;

    public Car(Engine engine) {
        this.engine = engine;
    }

    public void start() {
        engine.start();
    }
}
\`\`\`

