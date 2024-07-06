# Single Responsibility Principle (SRP)
**Definition:** A class should have only one reason to change.

**Example:**
\`\`\`java
class ReportGenerator {
    public String generateReport() {
        return "Report content";
    }
}

class ReportPrinter {
    public void printReport(String report) {
        System.out.println(report);
    }
}
\`\`\`

