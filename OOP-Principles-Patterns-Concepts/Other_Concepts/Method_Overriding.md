# Method Overriding
**Definition:** Method overriding occurs when a subclass provides a specific implementation of a method that is already defined in its superclass.

**Example:**
\`\`\`java
class Animal {
    void makeSound() {
        System.out.println("Animal sound");
    }
}

class Dog extends Animal {
    @Override
    void makeSound() {
        System.out.println("Bark");
    }
}
\`\`\`

