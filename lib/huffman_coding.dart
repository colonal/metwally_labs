import 'dart:collection';
import 'package:collection/collection.dart';

class HeapNode implements Comparable<HeapNode> {
  final String data;
  final int freq;
  HeapNode? left;
  HeapNode? right;

  HeapNode(this.data, this.freq);

  @override
  int compareTo(HeapNode other) {
    return freq - other.freq;
  }
}

class Huffman {
  String internalChar = String.fromCharCode(0);
  HashMap codes = HashMap();

  var priorityQueue =
      PriorityQueue<HeapNode>();

  Huffman(String message) {
    HashMap<String, int> freqHash = HashMap();

    for (int i = 0; i < message.length; i++) {
      if (freqHash[message[i]] == null) {
        freqHash[message[i]] = 1;
      } else {
        freqHash[message[i]] = freqHash[message[i]]! + 1;
      }
    }

    freqHash.forEach((char, freq) {
      HeapNode heapNode = HeapNode(char, freq);
      priorityQueue.add(heapNode);
    });

    late HeapNode top, left, right;
    int newFreq;
    while (priorityQueue.length != 1) {
      left = priorityQueue.removeFirst();
      right = priorityQueue.removeFirst();
      newFreq = left.freq + right.freq;

      top = HeapNode(internalChar, newFreq);
      top.left = left;
      top.right = right;

      priorityQueue.add(top);
    }

    generateCodes(priorityQueue.first, "");
  }

  void generateCodes(HeapNode? node, String srt) {
    if (node == null) {
      return;
    }
    if (node.data != internalChar) {
      codes[node.data] = srt;
    }

    generateCodes(node.left, "${srt}0");
    generateCodes(node.right, "${srt}1");
  }
}


void main(List<String> args) {
  String msg = "internet";
  Huffman huffman = Huffman(msg);

  huffman.codes.forEach((key, value) {
    print("$key $value");
  });
}

