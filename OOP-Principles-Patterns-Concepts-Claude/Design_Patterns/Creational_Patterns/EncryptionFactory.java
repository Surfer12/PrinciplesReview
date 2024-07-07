/**
 * This file demonstrates the Factory Method and Singleton patterns.
 * It provides a factory for creating different types of encryption strategies.
 */

// Strategy interface
interface EncryptionStrategy {
    String encrypt(String text);
    String decrypt(String text);
}

// Concrete strategy
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
        StringBuilder result = new StringBuilder();
        for (char character : text.toCharArray()) {
            if (Character.isLetter(character)) {
                char base = Character.isUpperCase(character) ? 'A' : 'a';
                result.append((char) ((character - base + shift + 26) % 26 + base));
            } else {
                result.append(character);
            }
        }
        return result.toString();
    }
}

// Factory (Singleton)
class EncryptionFactory {
    private static EncryptionFactory instance;

    private EncryptionFactory() {}

    public static synchronized EncryptionFactory getInstance() {
        if (instance == null) {
            instance = new EncryptionFactory();
        }
        return instance;
    }

    public EncryptionStrategy createCaesarCipher(int shift) {
        return new CaesarCipher(shift);
    }
}

// Usage demonstration
public class EncryptionDemo {
    public static void main(String[] args) {
        EncryptionFactory factory = EncryptionFactory.getInstance();
        EncryptionStrategy caesar = factory.createCaesarCipher(3);

        String original = "HELLO WORLD";
        String encrypted = caesar.encrypt(original);
        String decrypted = caesar.decrypt(encrypted);

        System.out.println("Original: " + original);
        System.out.println("Encrypted: " + encrypted);
        System.out.println("Decrypted: " + decrypted);
    }
}
