# Polymorphism
**Definition:** Polymorphism allows methods to do different things based on the object it is acting upon.

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

class Cat implements Animal {
    @Override
    public void makeSound() {
        System.out.println("Meow");
    }
}
\`\`\`

