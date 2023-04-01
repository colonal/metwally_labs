List<int> _insertionSort(List<int> arr) {
  for (var i = 1; i < arr.length; i++) {
    int key = arr[i];

    int j = i - 1;

    while (j >= 0) {
      if (arr[j] < key) break;

      arr[j + 1] = arr[j];
      --j;
    }
    arr[j + 1] = key;
  }

  return arr;
}

void main(List<String> args) {
  List<int> arr = [9, 5, 1, 4, 0];
  arr.insertionSort();
  print(arr);
}

extension Sort on List<int> {
  void insertionSort() {
    _insertionSort(this);
  }
}
