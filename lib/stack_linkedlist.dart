// ignore: file_names
import 'package:metwally_labs/linked_list.dart' show LinkedList;

class Stack<T> {
  late LinkedList<T> _linkedList;
  Stack() {
    _linkedList = LinkedList<T>();
  }

  push(T data) {
    _linkedList.insretFirest(data);
  }

  T? pop() {
    return _linkedList.deleteHead();
  }

  T? peek() {
    return _linkedList.head?.data;
  }

  bool isEmpty() {
    return _linkedList.lenth <= 0;
  }

  print() {
    _linkedList.printList();
  }

  size() {
    return _linkedList.lenth;
  }
}

void main(List<String> args) {
  Stack<int> stack = Stack();

  print("isEmpty: ${stack.isEmpty()}");

  stack.push(11);
  stack.push(22);
  stack.push(33);

  print("isEmpty: ${stack.isEmpty()}");
  print("size: ${stack.size()}");
  print("peek: ${stack.peek()}");
  stack.print();
  print("pop: ${stack.pop()}");
  print("size: ${stack.size()}");
  print("peek: ${stack.peek()}");
  stack.print();
}
