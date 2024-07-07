/**
 * This file demonstrates Java exception handling concepts:
 * - Checked exceptions
 * - Unchecked exceptions
 * - Try-with-resources
 * - Custom exceptions
 */

import java.io.*;

class CustomCheckedException extends Exception {
    public CustomCheckedException(String message) {
        super(message);
    }
}

class CustomUncheckedException extends RuntimeException {
    public CustomUncheckedException(String message) {
        super(message);
    }
}

public class ExceptionHandling {
    public static void main(String[] args) {
        // Demonstrating checked exception handling
        try {
            methodWithCheckedException();
        } catch (CustomCheckedException e) {
            System.out.println("Caught checked exception: " + e.getMessage());
        }

        // Demonstrating unchecked exception handling
        try {
            methodWithUncheckedException();
        } catch (CustomUncheckedException e) {
            System.out.println("Caught unchecked exception: " + e.getMessage());
        }

        // Demonstrating try-with-resources
        try (BufferedReader reader = new BufferedReader(new StringReader("Hello, World!"))) {
            String line = reader.readLine();
            System.out.println("Read line: " + line);
        } catch (IOException e) {
            System.out.println("IO Exception occurred: " + e.getMessage());
        }
    }

    private static void methodWithCheckedException() throws CustomCheckedException {
        throw new CustomCheckedException("This is a checked exception");
    }

    private static void methodWithUncheckedException() {
        throw new CustomUncheckedException("This is an unchecked exception");
    }
}
