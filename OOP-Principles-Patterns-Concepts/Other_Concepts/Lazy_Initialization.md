# Lazy Initialization
**Definition:** Lazy initialization is a tactic of delaying the creation of an object or the calculation of a value until it is needed.

**Example:**
\`\`\`java
class ExpensiveObject {
    private ExpensiveResource resource;

    public ExpensiveResource getResource() {
        if (resource == null) {
            resource = new ExpensiveResource();
        }
        return resource;
    }
}
\`\`\`

