# Abstraction
**Definition:** Abstraction is the concept of hiding the complex implementation details and showing only the essential features of the object.

**Example:**
\`\`\`java
abstract class Shape {
    abstract double area();
}

class Circle extends Shape {
    private double radius;

    public Circle(double radius) {
        this.radius = radius;
    }

    @Override
    double area() {
        return Math.PI * radius * radius;
    }
}
\`\`\`

