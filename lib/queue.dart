import 'linked_list.dart';

class Queue<T> {
  late LinkedList<T> _linkedList;

  Queue() {
    _linkedList = LinkedList();
  }

  void enqueue(T data) {
    _linkedList.insertLast(data);
  }

  T? dequeue() {
    return _linkedList.deleteHead();
  }

  T? peek() {
    return _linkedList.head?.data;
  }

  int size() {
    return _linkedList.lenth;
  }

  bool hasData() {
    return _linkedList.lenth > 0;
  }

  void print() {
    _linkedList.printList();
  }
}

void main(List<String> args) {
  Queue<int> queue = Queue();

  print("hasData: ${queue.hasData()}");
  queue.enqueue(1);
  queue.enqueue(2);
  queue.enqueue(3);
  queue.enqueue(4);
  print("hasData: ${queue.hasData()}");

  queue.print();

  while (queue.hasData()) {
    print("peek: ${queue.peek()}");
    print("dequeue: ${queue.dequeue()}");
    print("size: ${queue.size()}");
    queue.print();
    print("\n");
  }
  print("hasData: ${queue.hasData()}");
}
