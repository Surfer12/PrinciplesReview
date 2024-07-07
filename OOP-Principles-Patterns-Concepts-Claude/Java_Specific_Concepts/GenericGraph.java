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
