# Singleton
**Definition:** The Singleton Pattern ensures that a class has only one instance and provides a global point of access to it.

**Example:**
\`\`\`java
class Singleton {
    private static Singleton instance;

    private Singleton() {}

    public static Singleton getInstance() {
        if (instance == null) {
            instance = new Singleton();
        }
        return instance;
    }
}
\`\`\`

