class Node {
    int data;
    Node next;
    
    Node(int value) {
        this.data = value;
        this.next = null;
    }
}

public class LinkedList {
    private Node head;
    
    // Append at end
    public void append(int value) {
        Node newNode = new Node(value);
        
        if (head == null) {
            head = newNode;
            return;
        }
        
        Node temp = head;
        while (temp.next != null)
            temp = temp.next;
        
        temp.next = newNode;
    }
    
    // Insert after a specific node
    public void insertAfter(Node prevNode, int value) {
        if (prevNode == null) return;
        
        Node newNode = new Node(value);
        newNode.next = prevNode.next;
        prevNode.next = newNode;
    }
    
    // Delete by value
    public void deleteValue(int value) {
        Node temp = head;
        Node prev = null;
        
        if (temp != null && temp.data == value) {
            head = temp.next;
            return;
        }
        
        while (temp != null && temp.data != value) {
            prev = temp;
            temp = temp.next;
        }
        
        if (temp == null) return;  // value not found
        
        prev.next = temp.next;
    }
    
    // Print list
    public void printList() {
        Node current = head;
        while (current != null) {
            System.out.print(current.data + " -> ");
            current = current.next;
        }
        System.out.println("NULL");
    }
    
    // Get head node (for insertAfter testing)
    public Node getHead() {
        return head;
    }
    
    public static void main(String[] args) {
        LinkedList list = new LinkedList();
        
        list.append(10);
        list.append(20);
        list.append(30);
        
        System.out.print("After appending: ");
        list.printList();
        
        // Insert after first node (10)
        list.insertAfter(list.getHead(), 15);
        System.out.print("After insertion: ");
        list.printList();
        
        list.deleteValue(20);
        System.out.print("After deletion: ");
        list.printList();
    }
}