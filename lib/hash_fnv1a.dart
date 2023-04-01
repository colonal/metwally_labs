// ignore_for_file: constant_identifier_names

class HashFAV1A {
  static int hash32(String input) {
    const FNV_OFFSET = 0x811C9DC5;
    const FNV_PRIME = 0x01000193;
    int hash = FNV_OFFSET;
    for (int i = 0; i < input.length; i++) {
      hash = hash ^ input.codeUnitAt(i);
      hash = (hash * FNV_PRIME) & 0xffffffff;
    }
    print("[HashFAV1A]:$input, $hash, ${hash.toRadixString(16)}");
    return hash;
  }
}

void main(List<String> args) {
  HashFAV1A.hash32("this is Original Text");
  print(HashFAV1A.hash32("hello world").toRadixString(16));
}
