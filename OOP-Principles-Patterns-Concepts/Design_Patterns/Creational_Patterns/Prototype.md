# Prototype
**Definition:** The Prototype Pattern is used to create a duplicate object or clone of the current object to enhance performance.

**Example:**
\`\`\`java
abstract class Shape implements Cloneable {
    @Override
    protected Object clone() throws CloneNotSupportedException {
        return super.clone();
    }
}
\`\`\`

