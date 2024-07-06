# Abstract Class
**Definition:** An abstract class is a class that cannot be instantiated and is often used to define common characteristics for subclasses.

**Example:**
\`\`\`java
abstract class Animal {
    abstract void makeSound();
}

class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Bark");
    }
}
\`\`\`

