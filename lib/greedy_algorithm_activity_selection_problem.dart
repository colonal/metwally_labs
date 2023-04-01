List<int> greedyActivitySelection(List<int> start, List<int> end){
  List<int> solution =[0];

  // index List start
  late int i;
  // index List End
  int j = 0;

  for(i = 1; i < start.length; ++i){
    if (start[i] >= end[j]){
      solution.add(i);
      j = i;
    }
  }

  return solution;
}

void main(List<String> args) {
  List<int> start = [9,10,11,12,13,15];
  List<int> end   = [11,11,12,14,15,16];
  final solution = greedyActivitySelection(start, end);
  print(solution);
}