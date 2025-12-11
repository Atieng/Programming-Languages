# Node structure
class Node:
    def __init__(self, data):
        self.data = data
        self.next = None


# Linked List class
class LinkedList:
    def __init__(self):
        self.head = None

    # Insert at the end
    def append(self, value):
        new_node = Node(value)

        if self.head is None:
            self.head = new_node
            return

        temp = self.head
        while temp.next is not None:
            temp = temp.next

        temp.next = new_node

    # Insert at the beginning
    def prepend(self, value):
        new_node = Node(value)
        new_node.next = self.head
        self.head = new_node

    # Delete by value
    def delete_value(self, value):
        if self.head is None:
            return

        # If head is the value
        if self.head.data == value:
            self.head = self.head.next
            return

        prev = None
        temp = self.head

        while temp is not None and temp.data != value:
            prev = temp
            temp = temp.next

        if temp is None:
            return  # not found

        prev.next = temp.next

    # Print list
    def print_list(self):
        temp = self.head
        print("List:", end=" ")
        while temp:
            print(temp.data, end=" -> ")
            temp = temp.next
        print("None")

    
    def clear(self):
        self.head = None


 
# =========================
if __name__ == "__main__":
    ll = LinkedList()

    ll.append(10)
    ll.append(20)
    ll.append(30)
    ll.prepend(5)

    ll.print_list()

    ll.delete_value(20)
    ll.print_list()

    ll.clear()
