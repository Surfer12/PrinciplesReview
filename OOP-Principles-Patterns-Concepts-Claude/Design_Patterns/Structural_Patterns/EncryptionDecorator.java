/**
 * This file demonstrates the Decorator pattern.
 * It shows how to add additional functionality (logging) to encryption strategies.
 */

// Base component interface
interface EncryptionStrategy {
    String encrypt(String text);
    String decrypt(String text);
}

// Concrete component
class CaesarCipher implements EncryptionStrategy {
    private final int shift;

    public CaesarCipher(int shift) {
        this.shift = shift;
    }

    @Override
    public String encrypt(String text) {
        return applyCipher(text, shift);
    }

    @Override
    public String decrypt(String text) {
        return applyCipher(text, -shift);
    }

    private String applyCipher(String text, int shift) {
        // Implementation details...
        return text; // Placeholder
    }
}

// Decorator
class LoggingEncryptionDecorator implements EncryptionStrategy {
    private final EncryptionStrategy wrappee;

    public LoggingEncryptionDecorator(EncryptionStrategy wrappee) {
        this.wrappee = wrappee;
    }

    @Override
    public String encrypt(String text) {
        System.out.println("Encrypting: " + text);
        String result = wrappee.encrypt(text);
        System.out.println("Encrypted result: " + result);
        return result;
    }

    @Override
    public String decrypt(String text) {
        System.out.println("Decrypting: " + text);
        String result = wrappee.decrypt(text);
        System.out.println("Decrypted result: " + result);
        return result;
    }
}

// Usage demonstration
public class EncryptionDecoratorDemo {
    public static void main(String[] args) {
        EncryptionStrategy basicCipher = new CaesarCipher(3);
        EncryptionStrategy loggingCipher = new LoggingEncryptionDecorator(basicCipher);

        String original = "HELLO WORLD";
        String encrypted = loggingCipher.encrypt(original);
        String decrypted = loggingCipher.decrypt(encrypted);

        System.out.println("Original: " + original);
        System.out.println("Final decrypted: " + decrypted);
    }
}
