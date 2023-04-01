int _search(List<int> arr, int item) {
  int low = 0;
  int high = arr.length - 1;
  int mid = 0;

  while (low <= high) {
    mid = ((high + low) ~/ 2);
    if (arr[mid] == item) {
      return mid;
    } else if (arr[mid] < item) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return -1;
}

extension Search on List<int> {
  int search(int item) {
    return _search(this, item);
  }
}

void main(List<String> args) {
  List<int> arr = [1, 2, 3, 4, 5];
  print(arr.search(54));
}
