// inputs array, start, end
void segregate(List<int> arr, int s, int e) {
  if (e <= s) return;

  int midpoint = (e + s) ~/ 2;

  segregate(arr, s, midpoint);
  segregate(arr, midpoint + 1, e);
  merge(arr, s, midpoint, e);
}

// inputs array, start, midpoint, end
void merge(List<int> arr, int s, int m, int e) {
  //  i to left ; j to right; k to array
  int i = 0, j = 0, k = s;

  int leftLength = m - s + 1;

  int rightLength = e - m;

  List<int> leftArray = List.filled(leftLength, 0);
  List<int> rightArray = List.filled(rightLength, 0);

  for (int e = 0; e < leftLength; e++) {
    leftArray[e] = arr[s + e];
  }

  for (int e = 0; e < rightLength; e++) {
    rightArray[e] = arr[m + 1 + e];
  }

  while (i < leftLength && leftArray[i] <= 0) {
    arr[k] = leftArray[i];
    i++;

    k++;
  }

  while (j < rightLength && rightArray[j] <= 0) {
    arr[k] = rightArray[j];
    j++;

    k++;
  }

  while (i < leftLength) {
    arr[k] = leftArray[i];
    i++;
    k++;
  }
  while (j < rightLength) {
    arr[k] = rightArray[j];
    j++;
    k++;
  }
}

void main(List<String> args) {
  List<int> arr = [6, -5, 12, 10, -9, -1];
  print(arr);
  segregate(arr, 0, arr.length - 1);
  print(arr);
}
