# DRY (Dont Repeat Yourself)
**Definition:** DRY is a principle aimed at reducing the repetition of code by abstracting out commonalities into a single location.

**Example:**
\`\`\`java
public class User {
    private String name;
    private String email;

    // Other fields and methods

    public void printUserDetails() {
        System.out.println("Name: " + name);
        System.out.println("Email: " + email);
    }
}
\`\`\`

