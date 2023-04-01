class Heap {
  List<int> dataList = [];

  void insert(int data) {
    int i = dataList.length;
    dataList.add(data);

    int parentIndex = ((i - 1) / 2).floor();

    while (i != 0 && dataList[i] < dataList[parentIndex]) {
      dataList[i] = dataList[parentIndex];
      dataList[parentIndex] = data;
      i = parentIndex;
      parentIndex = ((i - 1) / 2).floor();
    }
  }

  int? pop() {
    int i = 0;
    final data = dataList[0];

    dataList[i] = dataList[dataList.length - 1];

    while ((2 * i + 1) < dataList.length) {
      int leftIndex = 2 * i + 1;
      int rightIndex = 2 * i + 2;

      int smallerIndex = leftIndex;

      if (rightIndex < dataList.length &&
          dataList[rightIndex] < dataList[leftIndex]) {
        smallerIndex = rightIndex;
      }

      if (dataList[smallerIndex] >= dataList[i]) {
        break;
      }

      int temp = dataList[i];
      dataList[i] = dataList[smallerIndex];
      dataList[smallerIndex] = temp;

      i = smallerIndex;
    }
    dataList.removeLast();
    return data;
  }
}

void main(List<String> args) {
  Heap heap = Heap();

  heap.insert(24);
  heap.insert(32);
  heap.insert(16);
  heap.insert(45);
  heap.insert(20);
  heap.insert(53);
  heap.insert(14);
  heap.insert(27);

  print(heap.dataList);

  while (heap.dataList.isNotEmpty) {
    print(heap.pop());
    print(heap.dataList);
  }
}
