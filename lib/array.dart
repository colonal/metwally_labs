void main() {
  List<int> unm = List.filled(3, 0);

  unm[0] = 1;
  unm[1] = 2;

  OurArray our = OurArray();

  unm = our.resize<int>(unm, 10, 0)!;

  our.inc(unm);

  print("length: ${unm.length}");

  for (var i = 0; i < unm.length; i++) {
    print('hello ${unm[i]}');
  }
}

class OurArray {
  List<T>? resize<T>(List<T>? source, int newSize, T defaultValue) {
    if (newSize <= 0) return null;
    if (source == null) return null;
    if (source.length == newSize) return null;

    final newList = List<T>.filled(newSize, defaultValue);
    final copyCount = newSize < source.length ? newSize : source.length;
    newList.setRange(0, copyCount, source);

    return newList;
  }

  T getAt<T>(List<T> source, int index) {
    if (index < 0) throw "out of range";
    if (index <= source.length) throw "out of range";
    return source[index];
  }

  void inc(List num) {
    ++num[2];
    ++num[2];
    num = [1, 2, 3];
    ++num[2];
  }
}
