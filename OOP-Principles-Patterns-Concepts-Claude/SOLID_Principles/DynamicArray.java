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
