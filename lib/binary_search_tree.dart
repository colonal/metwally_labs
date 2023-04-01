import 'queue.dart';

class Node<T> {
  T data;
  Node<T>? left;
  Node<T>? right;

  Node(this.data);
}

class NodeAndParent<T> {
  Node<T>? node;
  Node<T>? parent;
  bool? isLeft;
  NodeAndParent(
    this.node,
    this.parent,
    this.isLeft,
  );
}

class BinarySearchTree<T> {
  Node<T>? root;

  insert(T data) {
    Node<T> newNode = Node(data);
    if (root == null) {
      root = newNode;
      return;
    }

    Node<T>? currentNode = root!;

    while (currentNode != null) {
      if (currentNode.data.toString().compareTo(data.toString()) > 0) {
        if (currentNode.left == null) {
          currentNode.left = newNode;
          return;
        } else {
          currentNode = currentNode.left;
        }
      } else {
        if (currentNode.right == null) {
          currentNode.right = newNode;
          return;
        } else {
          currentNode = currentNode.right;
        }
      }
    }
  }

  T? _find(T data) {
    Node<T>? currentNode = root;

    while (currentNode != null) {
      if (currentNode.data == data) {
        return data;
      }

      if (currentNode.data!.toString().compareTo(data.toString()) > 0) {
        currentNode = currentNode.left;
      } else {
        currentNode = currentNode.right;
      }
    }

    return null;
  }

  bool isExesit(T data) {
    return _find(data) != null;
  }

  NodeAndParent<T>? findNodeAndParent(T data) {
    Node<T>? currentNode = root;
    Node<T>? parent;
    NodeAndParent<T>? nodeAndParent;
    bool left = false;

    while (currentNode != null) {
      if (currentNode.data == data) {
        nodeAndParent = NodeAndParent(currentNode, parent, left);
        break;
      }

      if (currentNode.data!.toString().compareTo(data.toString()) > 0) {
        parent = currentNode;
        left = true;
        currentNode = currentNode.left;
      } else {
        parent = currentNode;
        left = false;
        currentNode = currentNode.right;
      }
    }

    return nodeAndParent;
  }

  void delete(T data) {
    NodeAndParent<T>? nodeAndParent = findNodeAndParent(data);

    if (nodeAndParent == null || nodeAndParent.node == null) {
      return;
    }

    if (nodeAndParent.node!.left != null && nodeAndParent.node!.right != null) {
      _deleteHasChilds(nodeAndParent.node!);
    } else if (nodeAndParent.node!.left != null ||
        nodeAndParent.node!.right != null) {
      _deleteHasOneChild(nodeAndParent.node!);
    } else {
      _deleteHasLeaf(nodeAndParent);
    }
  }

  void _deleteHasLeaf(NodeAndParent<T> nodeAndParent) {
    if (nodeAndParent.parent == null) {
      this.root = null;
    } else if (nodeAndParent.isLeft!) {
      nodeAndParent.parent?.left = null;
    } else {
      nodeAndParent.parent?.right = null;
    }
  }

  void _deleteHasOneChild(Node<T> nodeToDelete) {
    Node<T>? nodeToReplace =
        nodeToDelete.left ?? nodeToDelete.right;

    nodeToDelete.data = nodeToReplace!.data;
    nodeToDelete.left = nodeToReplace.left;
    nodeToDelete.right = nodeToReplace.right;

    nodeToReplace = null;
  }

  void _deleteHasChilds(Node<T> nodeToDelete) {
    Node<T>? currentNode = nodeToDelete.right!;
    Node<T>? perentsSmollest;

    while (currentNode!.left != null) {
      perentsSmollest = currentNode;
      currentNode = currentNode.left!;
    }

    if (perentsSmollest != null) {
      perentsSmollest.left = currentNode.right;
    } else {
      nodeToDelete.right = currentNode.right;
    }

    nodeToDelete.data = currentNode.data;
    currentNode = null;
  }

  void balance() {
    List<T> nodes = inOrderIterable().toList();
    this.root = _recursiveBalance(0, nodes.length - 1, nodes);
  }

  Node<T>? _recursiveBalance(int start, int end, List<T> nodes) {
    if (start > end) {
      return null;
    }
    int mid = ((start + end) / 2).floor();
    Node<T> newNode = Node(nodes[mid]);

    newNode.left = _recursiveBalance(start, mid - 1, nodes);
    newNode.right = _recursiveBalance(mid + 1, end, nodes);
    return newNode;
  }

  Iterable<T> inOrderIterable() {
    Iterable<T> preOrder(Node<T>? node) sync* {
      if (node == null) return;

      for (var i in preOrder(node.left)) {
        yield i;
      }
      
      yield node.data;
      for (var i in preOrder(node.right)) {
        yield i;
      }
      
    }

    return preOrder(root);
  }

  Iterable<T> iterable() sync* {
    if (root == null) return;

    Queue<Node<T>> queue = Queue();

    queue.enqueue(root!);

    while (queue.hasData()) {
      Node<T> currentNode = queue.dequeue()!;
      yield currentNode.data;

      if (currentNode.left != null) {
        queue.enqueue(currentNode.left!);
      }
      if (currentNode.right != null) {
        queue.enqueue(currentNode.right!);
      }
    }
  }
}

void main(List<String> args) {
  BinarySearchTree bs = BinarySearchTree();

  // bs.insert(4);
  // bs.insert(6);
  // bs.insert(7);
  // bs.insert(5);
  // bs.insert(2);
  // bs.insert(1);
  // bs.insert(3);
  // print(bs.iterable().toList());

  // bs.delete(4);
  // bs.delete(6);
  // bs.delete(7);
  // bs.delete(5);
  // bs.delete(2);
  // bs.delete(1);
  // bs.delete(3);
  // print(bs.iterable().toList());

  bs.insert(1);
  bs.insert(2);
  bs.insert(3);
  bs.insert(4);
  bs.insert(5);
  bs.insert(6);
  bs.insert(7);
  print(bs.iterable().toList());

  bs.balance();

  print(bs.iterable().toList());
}
