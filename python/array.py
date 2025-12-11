class ArrayList:
    def __init__(self):
        self.data = []      # Python list used as dynamic array
        self.size = 0

    # Append at the end
    def append(self, value):
        self.data.append(value)
        self.size += 1

    # Insert at position
    def insert_at(self, position, value):
        if position < 0 or position > self.size:
            print("Position out of range")
            return
        self.data.insert(position, value)
        self.size += 1

    # Delete at position
    def delete_at(self, position):
        if position < 0 or position >= self.size:
            print("Position out of range")
            return
        self.data.pop(position)
        self.size -= 1

    # Print list
    def print_list(self):
        print("ArrayList:", self.data)

    # Get length
    def get_size(self):
        return self.size

# =====================
if __name__ == "__main__":
    arr = ArrayList()

    arr.append(10)
    arr.append(20)
    arr.append(30)
    arr.insert_at(1, 15)

    arr.print_list()   # [10, 15, 20, 30]

    arr.delete_at(2)
    arr.print_list()   # [10, 15, 30]

    print("Size:", arr.get_size())
