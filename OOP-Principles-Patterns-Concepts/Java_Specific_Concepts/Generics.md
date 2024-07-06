# Generics
**Definition:** Generics enable types (classes and interfaces) to be parameters when defining classes, interfaces, and methods.

**Example:**
\`\`\`java
class Box<T> {
    private T content;

    public void setContent(T content) {
        this.content = content;
    }

    public T getContent() {
        return content;
    }
}
\`\`\`

