# Liskov Substitution Principle (LSP)
**Definition:** Subtypes must be substitutable for their base types without altering the correctness of the program.

**Example:**
\`\`\`java
interface Flyable {
    void fly();
}

class FlyingBird implements Flyable {
    @Override
    public void fly() {
        System.out.println("Flying bird is flying");
    }
}

class NonFlyingBird {
    public void walk() {
        System.out.println("Non-flying bird is walking");
    }
}
\`\`\`

