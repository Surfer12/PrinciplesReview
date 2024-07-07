#!/bin/bash

# Create the main directory
mkdir -p OOP-Principles-Patterns-Concepts-Claude

# Create subdirectories
mkdir -p OOP-Principles-Patterns-Concepts-Claude/SOLID_Principles
mkdir -p OOP-Principles-Patterns-Concepts-Claude/Design_Patterns/Creational_Patterns
mkdir -p OOP-Principles-Patterns-Concepts-Claude/Design_Patterns/Structural_Patterns
mkdir -p OOP-Principles-Patterns-Concepts-Claude/Design_Patterns/Behavioral_Patterns
mkdir -p OOP-Principles-Patterns-Concepts-Claude/Java_Specific_Concepts

# Change to the main directory
cd OOP-Principles-Patterns-Concepts-Claude

# Create and populate files

# SOLID Principles
cat << 'EOF' > SOLID_Principles/DynamicArray.java
import java.util.*;
import java.util.function.Consumer;

/**
 * This file demonstrates SOLID principles in the implementation of a dynamic array.
 * It showcases:
 * - Single Responsibility Principle (SRP)
 * - Open/Closed Principle (OCP)
 * - Liskov Substitution Principle (LSP)
 * - Interface Segregation Principle (ISP)
 * - Dependency Inversion Principle (DIP)
 */

// Interface Segregation Principle (ISP)
interface Sizable {
    int size();
    boolean isEmpty();
}

interface Addable<T> {
    void add(T element);
}

interface Removable<T> {
    T remove(int index);
}

interface Retrievable<T> {
    T get(int index);
}

// Combining interfaces (ISP)
interface DynamicCollection<T> extends Sizable, Addable<T>, Removable<T>, Retrievable<T>, Iterable<T> {}

// Abstract class implementing common functionality (OCP)
abstract class AbstractDynamicCollection<T> implements DynamicCollection<T> {
    protected Object[] elements;
    protected int size;

    public AbstractDynamicCollection(int initialCapacity) {
        elements = new Object[initialCapacity];
        size = 0;
    }

    @Override
    public int size() {
        return size;
    }

    @Override
    public boolean isEmpty() {
        return size == 0;
    }

    @Override
    public void add(T element) {
        if (size == elements.length) {
            resize();
        }
        elements[size++] = element;
    }

    @SuppressWarnings("unchecked")
    @Override
    public T get(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
        }
        return (T) elements[index];
    }

    @SuppressWarnings("unchecked")
    @Override
    public T remove(int index) {
        if (index < 0 || index >= size) {
            throw new IndexOutOfBoundsException("Index: " + index + ", Size: " + size);
        }
        T removedElement = (T) elements[index];
        System.arraycopy(elements, index + 1, elements, index, size - index - 1);
        elements[--size] = null;
        return removedElement;
    }

    protected abstract void resize();

    // Iterator implementation (LSP)
    @Override
    public Iterator<T> iterator() {
        return new Iterator<T>() {
            private int currentIndex = 0;

            @Override
            public boolean hasNext() {
                return currentIndex < size;
            }

            @SuppressWarnings("unchecked")
            @Override
            public T next() {
                if (!hasNext()) {
                    throw new NoSuchElementException();
                }
                return (T) elements[currentIndex++];
            }
        };
    }
}

// Concrete implementation (SRP)
class DynamicArray<T> extends AbstractDynamicCollection<T> {
    private static final int DEFAULT_CAPACITY = 10;

    public DynamicArray() {
        super(DEFAULT_CAPACITY);
    }

    @Override
    protected void resize() {
        int newCapacity = elements.length * 2;
        elements = Arrays.copyOf(elements, newCapacity);
    }
}

// Factory for creating DynamicCollections (DIP)
class DynamicCollectionFactory {
    public static <T> DynamicCollection<T> createDynamicArray() {
        return new DynamicArray<>();
    }
}

// Usage demonstration
public class DynamicArrayDemo {
    public static void main(String[] args) {
        DynamicCollection<String> dynamicArray = DynamicCollectionFactory.createDynamicArray();

        dynamicArray.add("Apple");
        dynamicArray.add("Banana");
        dynamicArray.add("Cherry");

        System.out.println("Size: " + dynamicArray.size());
        System.out.println("First element: " + dynamicArray.get(0));

        for (String fruit : dynamicArray) {
            System.out.println(fruit);
        }

        String removed = dynamicArray.remove(1);
        System.out.println("Removed: " + removed);
        System.out.println("New size: " + dynamicArray.size());
    }
}
EOF

# Design Patterns - Creational
cat << 'EOF' > Design_Patterns/Creational_Patterns/EncryptionFactory.java
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
EOF

# Design Patterns - Structural
cat << 'EOF' > Design_Patterns/Structural_Patterns/EncryptionDecorator.java
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
EOF

# Design Patterns - Behavioral
cat << 'EOF' > Design_Patterns/Behavioral_Patterns/PathFindingStrategy.java
/**
 * This file demonstrates the Strategy and Observer patterns.
 * It implements different path-finding strategies for a graph.
 */

import java.util.*;

// Graph representation
class Graph {
    private final Map<Integer, Map<Integer, Integer>> adjacencyList;

    public Graph() {
        adjacencyList = new HashMap<>();
    }

    public void addEdge(int source, int destination, int weight) {
        adjacencyList.computeIfAbsent(source, k -> new HashMap<>()).put(destination, weight);
        adjacencyList.computeIfAbsent(destination, k -> new HashMap<>()).put(source, weight);
    }

    public Map<Integer, Integer> getNeighbors(int node) {
        return adjacencyList.getOrDefault(node, Collections.emptyMap());
    }

    public Set<Integer> getNodes() {
        return adjacencyList.keySet();
    }
}

// Strategy interface
interface PathFindingStrategy {
    List<Integer> findShortestPath(Graph graph, int start, int end);
}

// Concrete strategy: Dijkstra's algorithm
class DijkstraAlgorithm implements PathFindingStrategy {
    @Override
    public List<Integer> findShortestPath(Graph graph, int start, int end) {
        Map<Integer, Integer> distances = new HashMap<>();
        Map<Integer, Integer> previousNodes = new HashMap<>();
        PriorityQueue<Integer> queue = new PriorityQueue<>(Comparator.comparingInt(distances::get));

        for (int node : graph.getNodes()) {
            distances.put(node, Integer.MAX_VALUE);
            previousNodes.put(node, null);
        }
        distances.put(start, 0);
        queue.offer(start);

        while (!queue.isEmpty()) {
            int current = queue.poll();
            if (current == end) {
                break;
            }

            for (Map.Entry<Integer, Integer> neighbor : graph.getNeighbors(current).entrySet()) {
                int node = neighbor.getKey();
                int weight = neighbor.getValue();
                int distanceThroughCurrent = distances.get(current) + weight;

                if (distanceThroughCurrent < distances.get(node)) {
                    queue.remove(node);
                    distances.put(node, distanceThroughCurrent);
                    previousNodes.put(node, current);
                    queue.offer(node);
                }
            }
        }

        return reconstructPath(previousNodes, end);
    }

    private List<Integer> reconstructPath(Map<Integer, Integer> previousNodes, int end) {
        List<Integer> path = new ArrayList<>();
        for (Integer node = end; node != null; node = previousNodes.get(node)) {
            path.add(node);
        }
        Collections.reverse(path);
        return path;
    }
}

// Observer interface
interface PathFindingObserver {
    void onPathFound(List<Integer> path);
}

// Decorator that adds observation to path-finding
class ObservablePathFinding implements PathFindingStrategy {
    private final PathFindingStrategy strategy;
    private final List<PathFindingObserver> observers = new ArrayList<>();

    public ObservablePathFinding(PathFindingStrategy strategy) {
        this.strategy = strategy;
    }

    public void addObserver(PathFindingObserver observer) {
        observers.add(observer);
    }

    @Override
    public List<Integer> findShortestPath(Graph graph, int start, int end) {
        List<Integer> path = strategy.findShortestPath(graph, start, end);
        notifyObservers(path);
        return path;
    }

    private void notifyObservers(List<Integer> path) {
        for (PathFindingObserver observer : observers) {
            observer.onPathFound(path);
        }
    }
}

// Usage demonstration
public class PathFindingDemo {
    public static void main(String[] args) {
        Graph graph = new Graph();
        graph.addEdge(0, 1, 4);
        graph.addEdge(0, 2, 3);
        graph.addEdge(1, 2, 1);
        graph.addEdge(1, 3, 2);
        graph.addEdge(2, 3, 5);
        graph.addEdge(3, 4, 2);

        PathFindingStrategy dijkstra = new DijkstraAlgorithm();
        ObservablePathFinding observableDijkstra = new ObservablePathFinding(dijkstra);

        observableDijkstra.addObserver(path -> System.out.println("Path found: " + path));

        List<Integer> shortestPath = observableDijkstra.findShortestPath(graph, 0, 4);
        System.out.println("Shortest path from 0 to 4: " + shortestPath);
    }
}
EOF

# Java Specific Concepts
cat << 'EOF' > Java_Specific_Concepts/GenericGraph.java
/**
 * This file demonstrates Java-specific concepts including:
 * - Generics
 * - Functional interfaces
 * - Lambda expressions
 * - Stream API
 */

import java.util.*;
import java.util.function.BiFunction;
import java.util.stream.Collectors;

public class GenericGraph<T> {
    private final Map<T, Map<T, Integer>> adjacencyList;

    public GenericGraph() {
        adjacencyList = new HashMap<>();
    }

    public void addEdge(T source, T destination, int weight) {
        adjacencyList.computeIfAbsent(source, k -> new HashMap<>()).put(destination, weight);cat << 'EOF' > Java_Specific_Concepts/GenericGraph.java
/**
 * This file demonstrates Java-specific concepts including:
 * - Generics
 * - Functional interfaces
 * - Lambda expressions
 * - Stream API
 */

import java.util.*;
import java.util.function.BiFunction;
import java.util.stream.Collectors;

public class GenericGraph<T> {
    private final Map<T, Map<T, Integer>> adjacencyList;

    public GenericGraph() {
        adjacencyList = new HashMap<>();
    }

    public void addEdge(T source, T destination, int weight) {
        adjacencyList.computeIfAbsent(source, k -> new HashMap<>()).put(destination, weight);
        adjacencyList.computeIfAbsent(destination, k -> new HashMap<>()).put(source, weight);
    }

    public Map<T, Integer> getNeighbors(T node) {
        return adjacencyList.getOrDefault(node, Collections.emptyMap());
    }

    public Set<T> getNodes() {
        return adjacencyList.keySet();
    }

    // Demonstrating the use of functional interface and lambda
    public Optional<T> findNode(BiFunction<T, Map<T, Integer>, Boolean> predicate) {
        return adjacencyList.entrySet().stream()
                .filter(entry -> predicate.apply(entry.getKey(), entry.getValue()))
                .map(Map.Entry::getKey)
                .findFirst();
    }

    // Demonstrating the use of Stream API
    public List<T> getNodesSortedByEdgeCount() {
        return adjacencyList.entrySet().stream()
                .sorted(Comparator.comparingInt(e -> e.getValue().size()))
                .map(Map.Entry::getKey)
                .collect(Collectors.toList());
    }

    public static void main(String[] args) {
        GenericGraph<String> graph = new GenericGraph<>();
        graph.addEdge("A", "B", 1);
        graph.addEdge("B", "C", 2);
        graph.addEdge("C", "D", 3);
        graph.addEdge("A", "D", 4);

        // Using the functional interface method
        Optional<String> nodeWithMostEdges = graph.findNode((node, edges) -> edges.size() > 2);
        nodeWithMostEdges.ifPresent(node -> System.out.println("Node with most edges: " + node));

        // Using the Stream API method
        List<String> sortedNodes = graph.getNodesSortedByEdgeCount();
        System.out.println("Nodes sorted by edge count: " + sortedNodes);
    }
}
EOF

# Add more Java-specific concept demonstrations

cat << 'EOF' > Java_Specific_Concepts/ExceptionHandling.java
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
EOF

cat << 'EOF' > Java_Specific_Concepts/InterfaceDemo.java
/**
 * This file demonstrates Java interface concepts:
 * - Default methods
 * - Static methods in interfaces
 * - Functional interfaces
 */

import java.util.function.Predicate;

interface Vehicle {
    void start();
    void stop();

    // Default method
    default void horn() {
        System.out.println("Beep beep!");
    }

    // Static method in interface
    static boolean isMoving(Vehicle vehicle) {
        return vehicle.getCurrentSpeed() > 0;
    }

    int getCurrentSpeed();
}

// Functional interface
@FunctionalInterface
interface SpeedCheck {
    boolean isSpeeding(int speed);
}

class Car implements Vehicle {
    private int currentSpeed = 0;

    @Override
    public void start() {
        System.out.println("Car started");
    }

    @Override
    public void stop() {
        System.out.println("Car stopped");
    }

    @Override
    public int getCurrentSpeed() {
        return currentSpeed;
    }

    public void accelerate(int speed) {
        currentSpeed += speed;
    }
}

public class InterfaceDemo {
    public static void main(String[] args) {
        Car car = new Car();
        car.start();
        car.horn(); // Using default method
        car.accelerate(50);

        System.out.println("Is car moving? " + Vehicle.isMoving(car)); // Using static method

        // Using functional interface
        SpeedCheck speedLimit = speed -> speed > 60;
        System.out.println("Is car speeding? " + speedLimit.isSpeeding(car.getCurrentSpeed()));

        // Using Predicate (built-in functional interface)
        Predicate<Integer> speedCheck = speed -> speed > 60;
        System.out.println("Is car speeding? " + speedCheck.test(car.getCurrentSpeed()));

        car.stop();
    }
}
EOF

echo "Java files demonstrating various concepts have been created successfully."