#include <stdio.h>
#include <stdlib.h>

typedef struct Node {
    int data;
    struct Node* next;
} Node;

// Append at end
void append(Node** head, int value) {
    Node* newNode = malloc(sizeof(Node));
    newNode->data = value;
    newNode->next = NULL;

    if (*head == NULL) {
        *head = newNode;
        return;
    }

    Node* temp = *head;
    while (temp->next != NULL)
        temp = temp->next;

    temp->next = newNode;
}

// Insert after a specific node
void insertAfter(Node* prevNode, int value) {
    if (prevNode == NULL) return;

    Node* newNode = malloc(sizeof(Node));
    newNode->data = value;
    newNode->next = prevNode->next;
    prevNode->next = newNode;
}

// Delete by value
void deleteValue(Node** head, int value) {
    Node* temp = *head;
    Node* prev = NULL;

    if (temp != NULL && temp->data == value) {
        *head = temp->next;
        free(temp);
        return;
    }

    while (temp != NULL && temp->data != value) {
        prev = temp;
        temp = temp->next;
    }

    if (temp == NULL) return;  // value not found

    prev->next = temp->next;
    free(temp);
}

void printList(Node* head) {
    while (head != NULL) {
        printf("%d -> ", head->data);
        head = head->next;
    }
    printf("NULL\n");
}

int main() {
    Node* list = NULL;

    append(&list, 10);
    append(&list, 20);
    append(&list, 30);

    printf("After appending: ");
    printList(list);

    insertAfter(list, 15);  // insert after 10
    printf("After insertion: ");
    printList(list);

    deleteValue(&list, 20);
    printf("After deletion: ");
    printList(list);

    return 0;
}
