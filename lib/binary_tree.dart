import 'dart:io';
import 'dart:math';

import 'queue.dart';

class TreeNode<T> {
  final T data;
  TreeNode<T>? left;
  TreeNode<T>? right;

  TreeNode(this.data);
}

class BinaryTree<T> {
  TreeNode<T>? _root;

  void insert(T data) {
    TreeNode<T> newNode = TreeNode(data);
    if (_root == null) {
      _root = newNode;
      return;
    }

    Queue<TreeNode<T>> q = Queue<TreeNode<T>>();

    q.enqueue(_root!);

    while (q.hasData()) {
      TreeNode<T> curantNode = q.dequeue()!;

      if (curantNode.left == null) {
        curantNode.left = newNode;
        break;
      } else {
        q.enqueue(curantNode.left!);
      }
      if (curantNode.right == null) {
        curantNode.right = newNode;
        break;
      } else {
        q.enqueue(curantNode.right!);
      }
    }
  }

  int height() {
    int height(TreeNode? node) {
      if (node == null) return 0;
      return 1 + max(height(node.left), height(node.right));
    }

    return height(_root);
  }

  void printTree() {
    if (_root == null) {
      return;
    }

    Queue<TreeNode<T>> q = Queue<TreeNode<T>>();

    q.enqueue(_root!);

    while (q.hasData()) {
      TreeNode<T> curantNode = q.dequeue()!;
      stdout.write("${curantNode.data}=> ");

      if (curantNode.left != null) {
        q.enqueue(curantNode.left!);
      }
      if (curantNode.right != null) {
        q.enqueue(curantNode.right!);
      }
    }

    stdout.write("null\n");
  }

  void preOrder() {
    preOrder(TreeNode<T>? node) {
      if (node == null) return;
      stdout.write("${node.data}-> ");

      preOrder(node.left);
      preOrder(node.right);
    }

    preOrder(_root);
    print("null");
  }

  void inOrder() {
    inOrder(TreeNode? node) {
      if (node == null) return;

      inOrder(node.left);
      stdout.write("${node.data}-> ");
      inOrder(node.right);
    }

    inOrder(_root);
    print("null");
  }

  void postOrder() {
    postOrder(TreeNode? node) {
      if (node == null) return;

      postOrder(node.left);
      postOrder(node.right);
      stdout.write("${node.data}-> ");
    }

    postOrder(_root);
    print("null");
  }

  Iterable<TreeNode<T>> preOrderIterable() {
    Iterable<TreeNode<T>> preOrder(TreeNode<T>? node) sync* {
      if (node == null) return;
      yield node;

      for (var i in preOrder(node.left)) {
        yield i;
      }
      

      for (var i in preOrder(node.right)) {
        yield i;
      }
      
    }

    return preOrder(_root);
  }

  void delete(T data) {
    if (_root?.data == null) return;

    TreeNode<T>? curentNode;

    TreeNode<T>? parent;

    for (final node in preOrderIterable()) {
      if (node.data == data) {
        curentNode = node;
        parent = null;
        break;
      }
      if (node.left?.data == data) {
        curentNode = node.left!;
        parent = node;
        break;
      } else if (node.right?.data == data) {
        curentNode = node.right!;
        parent = node;
        break;
      }
    }

    if (curentNode == null) throw "Not finde";

    final last = preOrderIterable().last;

    for (final node in preOrderIterable()) {
      if (node.left?.data == last.data) {
        node.left = null;
        break;
      } else if (node.right?.data == last.data) {
        node.right = null;
        break;
      }
    }

    last.left = curentNode.left;
    last.right = curentNode.right;

    if (parent != null) {
      if (parent.left!.data == data) {
        parent.left = last;
      } else {
        parent.right = last;
      }
    } else {
      _root = last;
    }

    curentNode = null;
  }
}

void main(List<String> args) {
  BinaryTree<String> bt = BinaryTree();

  bt.insert("A");

  bt.insert("B");
  bt.insert("C");

  bt.insert("D");
  bt.insert("E");
  bt.insert("F");
  bt.insert("G");

  bt.insert("H");
  bt.insert("I");

  // bt.Print();
  // print("height: ${bt.height()}");
  // bt.preOrder();
  // bt.inOrder();
  // bt.postOrder();
  // bt.preOrderIterable().forEach((element) {
  //   print(element.data);
  // });

  bt.preOrder();
  bt.delete("A");
  bt.preOrder();
}
