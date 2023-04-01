class CharFreq {
  void asciiMethod(String text) {
    List<int> freq = List.filled(127, 0);

    for (final i in text.split("")) {
      int currentCode = i.codeUnitAt(0);

      ++freq[currentCode];
    }

    for (final i in text.split("").toList().toSet()) {
      int currentCode = i.codeUnitAt(0);
      print("$i: ${freq[currentCode]}");
    }
  }

  void anyCodeMethod(String message) {
    Map<String, int> freq = {};

    for (int i = 0; i < message.length; ++i) {
      if (freq[message[i]] == null) {
        freq[message[i]] = 1;
      } else {
        freq[message[i]] = 1 + freq[message[i]]!;
      }
    }


    sortMap(freq);
  }

  void sortMap(Map freq) {
    List<List> freqArray = [];

    freq.forEach((key, value) {
      freqArray.add([key, value]);
    });

    
    sort(freqArray,   0 , freq.length-1);

    for (var element in freqArray) {
      print("${element[0]}:${element[1]}");
    }
  }

  void sort(List<List> arr, int s, int e) {
    if (s >= e) return;
    int midpoint = ((e + s) / 2).floor();

    sort(arr, s, midpoint);
    sort(arr, midpoint + 1, e);
    marge(arr, s, midpoint, e);
  }
}

void marge(List<List> arr, int s, int m, int e) {
  int i = 0, j = 0, k = s;

  int lLength = m - s + 1;
  int rLength = e - m;

  List<List> lAarr = List.filled(lLength, []);
  List<List> rAarr = List.filled(rLength, []);

  for (int i = 0; i < lLength; i++) {
    lAarr[i] = arr[s + i];
  }


  for (int i = 0; i < rLength; i++) {
    
    rAarr[i] = arr[m  +1+ i];
  }

  

  while (i < lLength && j < rLength) {
    if (lAarr[i][1] <= rAarr[j][1]) {
      arr[k] = lAarr[i];
      ++i;
      
      
    } else {
       arr[k] = rAarr[j];
      ++j;
    }
    ++k;
  }

  while(i< lLength){
    arr[k] = lAarr[i];
    ++i;
    ++k;
  }
  while(j< rLength){
    arr[k] = rAarr[j];
    ++j;
    ++k;
  }
}

void main(List<String> args) {
  CharFreq charFreq = CharFreq();
  charFreq.anyCodeMethod("hello world");
}
