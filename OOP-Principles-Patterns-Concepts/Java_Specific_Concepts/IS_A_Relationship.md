# IS-A Relationship
**Definition:** IS-A relationship is based on inheritance. It is a way to express a parent-child relationship between classes.

**Example:**
\`\`\`java
class Animal {
    void eat() {
        System.out.println("Animal is eating");
    }
}

class Dog extends Animal {
    void bark() {
        System.out.println("Dog is barking");
    }
}
\`\`\`

