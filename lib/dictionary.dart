import 'dart:io';

import 'key_value_pair.dart';

class Dictionary<Tkey, Tvalue> {
  late List<KeyValuePair<Tkey, Tvalue>> entries;

  Dictionary() {
    entries = [];
  }

  int size() {
    return this.entries.length;
  }

  void set(Tkey key, Tvalue value) {
    for (final pair in this.entries) {
      if (pair.key == key) {
        pair.value = value;
        return;
      }
    }

    KeyValuePair<Tkey, Tvalue> newPair = KeyValuePair(key, value);

    this.entries.add(newPair);
  }

  Tvalue get(Tkey key) {
    return this
        .entries
        .firstWhere((pair) => pair.key == key, orElse: () => throw "Not exist")
        .value;
  }

  bool remove(Tkey key) {
    bool isRemove = false;
    this.entries.removeWhere((pair) {
      if (pair.key == key) {
        isRemove = true;
        return true;
      }
      return false;
    });

    return isRemove;
  }

  void printData() {
    print("-------------");
    print("[Size]: ${this.entries.length}");
    stdout.write("{");
    for (final pair in this.entries) {
      stdout.write("${pair.key}:${pair.value}, ");
    }
    print("}");
    print("-------------");
  }
}

void main(List<String> args) {
  Dictionary<int, String> dictionary = Dictionary();

  dictionary.set(1, "value1");
  dictionary.set(2, "value2");
  dictionary.set(3, "value3");

  dictionary.printData();
  print("remove: ${dictionary.remove(5)}");
  dictionary.printData();

  print("get: ${dictionary.get(4)}");
}
