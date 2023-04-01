import 'dart:io' as io;

class Node<T> {
  T data;
  Node<T>? next;

  Node(this.data, {this.next});
}

class LinkedListIterator<T> {
  Node<T>? _currentNode;

  LinkedListIterator({Node<T>? currentNode}) {
    _currentNode = currentNode;
  }

  T? data() {
    return _currentNode?.data;
  }

  LinkedListIterator<T>? next() {
    _currentNode = _currentNode?.next;
    return this;
  }

  Node<T>? current() {
    return _currentNode;
  }
}

class LinkedList<T> {
  Node<T>? head;
  Node<T>? tail;
  late int lenth;
  LinkedList() {
    lenth = 0;
  }

  LinkedListIterator<T> begin() {
    return LinkedListIterator(currentNode: this.head);
  }

  void printList() {
    io.stdout.write("printList\n");
    for (LinkedListIterator<T> itr = this.begin();
        itr.current() != null;
        itr.next()) {
      io.stdout.write("${itr.data()} -> ");
    }
    io.stdout.write("null\n");
  }

  void insertLast(T data) {
    Node<T> newNode = Node<T>(data);
    if (head == null && tail == null) {
      head = newNode;
      tail = newNode;
    } else {
      tail!.next = newNode;
      tail = newNode;
    }
    ++lenth;
  }

  Node<T> findeIndex(int index) {
    LinkedListIterator<T> itr = begin();
    for (int i = 1; i <= index && itr.data() != null; ++i) {
      itr.next();
    }

    if (itr.data() == null) {
      throw "out of range";
    }
    return itr.current()!;
  }

  void insertAfter(T data, {required int index}) {
    Node<T> current = this.findeIndex(index);
    print(current.data!);
    Node<T> newNode = Node(data);

    newNode.next = current.next;
    current.next = newNode;
    if (newNode.next == null) {
      tail = newNode;
    }
    ++lenth;
  }

  void insertBefore(T data, {required int index}) {
    if (index == 0) {
      Node<T> newNode = Node(data);
      newNode.next = head;
      head = newNode;
      return;
    } else {
      insertAfter(data, index: index - 1);
    }
    ++lenth;
  }

  void delete({required int index}) {
    Node<T>? current = this.findeIndex(index);
    if (current == head && current == tail) {
      head = tail = null;
    } else if (current == head) {
      head = head!.next;
    } else {
      Node<T> parent = this.findeIndex(index - 1);
      if (current == tail) {
        tail = parent;
        tail!.next = null;
      } else {
        parent.next = current.next;
      }
    }

    current = null;
    --lenth;
  }

  LinkedList<T> copy() {
    LinkedList<T> newLinkedList = LinkedList();

    for (final itr = this.begin(); itr.current() != null; itr.next()) {
      newLinkedList.insertLast(itr.data() as T);
    }

    return newLinkedList;
  }

  T? deleteHead() {
    if (this.head == null) {
      return null;
    }

    Node<T>? del = this.head!;
    this.head = this.head?.next;

    T data = del.data;
    del = null;
    --this.lenth;
    if (this.head == null) {
      this.tail = this.head;
    }

    return data;
  }

  void insretFirest(T data) {
    Node<T> newNode = Node(data);

    if (this.head == null) {
      this.head = this.tail = newNode;
    } else {
      newNode.next = this.head;
      this.head = newNode;
    }
    ++this.lenth;
  }
}

void main(List<String> args) {
  LinkedList<int> linkedList = LinkedList();

  linkedList.insertLast(1);
  linkedList.insertLast(2);
  linkedList.insertLast(4);

  linkedList.printList();
  print(linkedList.lenth);

  // linkedList.insertAfter(99, index: 2);
  // linkedList.printList();

  // linkedList.insertBefore(99, index: 3);
  // linkedList.printList();

  // linkedList.delete(index: 2);
  // linkedList.printList();

  // print("head: ${linkedList.head?.data}");
  // print("tail: ${linkedList.tail?.data}");

  // LinkedList<int> newLinkedList = linkedList.copy();
  // newLinkedList.printList();

  linkedList.deleteHead();
  linkedList.printList();
  print(linkedList.lenth);
  linkedList.deleteHead();
  linkedList.printList();
  print(linkedList.lenth);
  linkedList.deleteHead();
  linkedList.printList();
  print(linkedList.lenth);
}
