# Factory Method
**Definition:** The Factory Method Pattern defines an interface for creating an object but lets subclasses alter the type of objects that will be created.

**Example:**
\`\`\`java
interface ShapeFactory {
    Shape createShape();
}

class CircleFactory implements ShapeFactory {
    @Override
    public Shape createShape() {
        return new Circle();
    }
}
\`\`\`

