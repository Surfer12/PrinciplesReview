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
