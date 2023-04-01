import 'dart:io';

import 'hash_fnv1a.dart';
import 'key_value_pair.dart';

class HashTable<Tkey, Tvalue> {
  late List<KeyValuePair<Tkey, Tvalue>?> entries;
  late int initialSize;
  late int enteriesCount;

  HashTable() {
    initialSize = 3;
    enteriesCount = 0;
    entries = List.filled(initialSize, null);
  }

  int getHash(Tkey key) {
    int hashFAV1A = HashFAV1A.hash32(key.toString());

    return hashFAV1A % this.entries.length;
  }

  int collisionHandling(Tkey key, int hash, bool set) {
    late int newHash;
    for (int i = 0; i < this.entries.length; ++i) {
      newHash = (hash + i) % this.entries.length;
      if (set &&
          (this.entries[newHash]?.key == null ||
              this.entries[newHash]!.key == key)) {
        return newHash;
      } else if (!set && this.entries[newHash]?.key == key) {
        return newHash;
      }
    }
    return -1;
  }

  void addToEntries(Tkey key, Tvalue value) {
    int hash = this.getHash(key);

    if (this.entries[hash] != null && this.entries[hash]!.key != key) {
      hash = this.collisionHandling(key, hash, true);
    }

    if (hash == -1) {
      throw "Invalid Hashtable !!!";
    }
    if (this.entries[hash] == null) {
      KeyValuePair<Tkey, Tvalue> newPair = KeyValuePair(key, value);
      this.entries[hash] = newPair;
      this.enteriesCount++;
    } else if (this.entries[hash]?.key == key) {
      this.entries[hash]?.value = value;
    } else {
      throw "Invalid Hashtable !!!";
    }
  }

  void resizeOrNot() {
    if (this.enteriesCount < this.entries.length) {
      return;
    }

    int newSize = this.entries.length * 2;

    List<KeyValuePair<Tkey, Tvalue>?>? temp = this.entries;
    this.entries = List.filled(newSize, null);
    this.enteriesCount = 0;
    for (int i = 0; i < temp.length; i++) {
      if (temp[i] == null) continue;
      this.addToEntries(temp[i]!.key, temp[i]!.value);
    }
    temp = null;

    print("[resize]: $newSize");
  }

  void set(Tkey key, Tvalue value) {
    this.resizeOrNot();
    this.addToEntries(key, value);
  }

  Tvalue? get(Tkey key) {
    int hash = this.getHash(key);

    if (this.entries[hash] != null && this.entries[hash]!.key != key) {
      hash = this.collisionHandling(key, hash, false);
    }

    if (hash == -1 || this.entries[hash] == null) {
      return null;
    } else if (this.entries[hash]?.key == key) {
      return this.entries[hash]?.value;
    } else {
      throw "Invalid Hashtable !!!";
    }
  }

  void printData() {
    print("-------------");
    print("[Size]: ${this.enteriesCount}");
    stdout.write("{");
    for (final pair in this.entries) {
      stdout.write("${pair?.key}:${pair?.value}, ");
    }
    print("}");
    print("-------------");
  }
}

void main(List<String> args) {
  HashTable<String, String> table = HashTable();
  table.printData();

  table.set("Sinar", "MO-M@gmail.com");
  table.set("Elvis", "DOD@gmail.com");
  table.set("Tane", "gak@gmail.com");
  table.set("Tane", "ggggggggggak@gmail.com");
  table.set("Ta1ne", "ggggggggggak@gmail.com");
  table.printData();
  print("-------------");
  print(table.get("Sinar1"));
}
