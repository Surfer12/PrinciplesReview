# Interface Segregation Principle (ISP)
**Definition:** Clients should not be forced to depend on interfaces they do not use.

**Example:**
\`\`\`java
interface Printer {
    void print();
}

interface Scanner {
    void scan();
}

class MultiFunctionPrinter implements Printer, Scanner {
    @Override
    public void print() {
        System.out.println("Printing document...");
    }

    @Override
    public void scan() {
        System.out.println("Scanning document...");
    }
}

class SimplePrinter implements Printer {
    @Override
    public void print() {
        System.out.println("Printing document...");
    }
}
\`\`\`

