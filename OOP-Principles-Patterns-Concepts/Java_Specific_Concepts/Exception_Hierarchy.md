# Exception Hierarchy
**Definition:** The exception hierarchy in Java is a tree of classes that inherit from `Throwable`.

**Example:**
\`\`\`java
public void exampleMethod() {
    try {
        // Code that may throw an exception
    } catch (IOException e) {
        // Handle IOException
    } catch (Exception e) {
        // Handle other exceptions
    }
}
\`\`\`

