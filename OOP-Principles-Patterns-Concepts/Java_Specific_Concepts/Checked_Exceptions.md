# Checked Exceptions
**Definition:** Checked exceptions are exceptions that are checked at compile time.

**Example:**
\`\`\`java
public void readFile(String filePath) throws IOException {
    BufferedReader reader = new BufferedReader(new FileReader(filePath));
    // Read file
}
\`\`\`

