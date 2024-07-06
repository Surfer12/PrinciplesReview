# Interfaces
**Definition:** An interface is a reference type in Java that can contain only constants, method signatures, default methods, static methods, and nested types.

**Example:**
\`\`\`java
interface Animal {
    void makeSound();
}

class Dog implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Bark");
    }
}
\`\`\`

