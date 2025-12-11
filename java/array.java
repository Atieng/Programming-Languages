import java.util.Arrays;

public class DynamicArray {

    private int[] data;
    private int size;

    // Constructor
    public DynamicArray(int capacity) {
        data = new int[capacity];
        size = 0;
    }

    // Default constructor
    public DynamicArray() {
        this(2);
    }

    // Resize when full
    private void resize() {
        data = Arrays.copyOf(data, data.length * 2);
    }

    // Add at end
    public void append(int value) {
        if (size == data.length) {
            resize();
        }
        data[size++] = value;
    }

    // Insert at position
    public void insertAt(int pos, int value) {
        if (pos < 0 || pos > size) {
            System.out.println("Invalid position");
            return;
        }

        if (size == data.length) {
            resize();
        }

        for (int i = size; i > pos; i--) {
            data[i] = data[i - 1];
        }

        data[pos] = value;
        size++;
    }

    // Delete at position
    public void deleteAt(int pos) {
        if (pos < 0 || pos >= size) {
            System.out.println("Invalid position");
            return;
        }

        for (int i = pos; i < size - 1; i++) {
            data[i] = data[i + 1];
        }

        size--;
    }

    // Get element
    public int get(int pos) {
        if (pos < 0 || pos >= size) {
            System.out.println("Invalid index");
            return -1;
        }
        return data[pos];
    }

    // Update element
    public void update(int pos, int value) {
        if (pos < 0 || pos >= size) {
            System.out.println("Invalid index");
            return;
        }
        data[pos] = value;
    }

    // Search for value
    public int search(int value) {
        for (int i = 0; i < size; i++) {
            if (data[i] == value) {
                return i;
            }
        }
        return -1;
    }

    // Print array
    public void print() {
        System.out.print("Array: ");
        for (int i = 0; i < size; i++) {
            System.out.print(data[i] + " ");
        }
        System.out.println();
    }

    public static void main(String[] args) {
        DynamicArray arr = new DynamicArray(2);

        arr.append(10);
        arr.append(20);
        arr.append(30); // resize happens

        arr.print();

        arr.insertAt(1, 99);
        arr.print();

        System.out.println("Element at 2: " + arr.get(2));

        arr.update(1, 55);
        arr.print();

        arr.deleteAt(0);
        arr.print();

        int pos = arr.search(30);
        System.out.println("Search 30 found at: " + pos);
    }
}
