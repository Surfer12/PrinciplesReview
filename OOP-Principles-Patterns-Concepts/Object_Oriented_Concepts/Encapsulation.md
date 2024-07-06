# Encapsulation
**Definition:** Encapsulation is the technique of making the fields in a class private and providing access to the fields via public methods.

**Example:**
\`\`\`java
class Account {
    private double balance;

    public double getBalance() {
        return balance;
    }

    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        }
    }

    public void withdraw(double amount) {
        if (amount > 0 && amount <= balance) {
            balance -= amount;
        }
    }
}
\`\`\`

