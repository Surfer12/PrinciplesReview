# Iterator
**Definition:** The Iterator Pattern provides a way to access the elements of an aggregate object sequentially without exposing its underlying representation.

**Example:**
\`\`\`java
interface Iterator {
    boolean hasNext();
    Object next();
}

class NameRepository {
    public String[] names = {"John", "Jane", "Jack", "Jill"};

    public Iterator getIterator() {
        return new NameIterator();
    }

    private class NameIterator implements Iterator {
        int index;

        @Override
        public boolean hasNext() {
            return index < names.length;
        }

        @Override
        public Object next() {
            if (this.hasNext()) {
                return names[index++];
            }
            return null;
        }
    }
}
\`\`\`

