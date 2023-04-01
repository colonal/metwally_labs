final int intMaxValue = double.maxFinite.toInt();
void main(List<String> args) {

  const  List labels = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"];
  const  List<List<int>>data = [
    [0, 2, 4, 3, 0, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 7, 4, 6, 0, 0, 0],
    [0, 0, 0, 0, 3, 2, 4, 0, 0, 0],
    [0, 0, 0, 0, 4, 1, 5, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 4, 0],
    [0, 0, 0, 0, 0, 0, 0, 6, 3, 0],
    [0, 0, 0, 0, 0, 0, 0, 3, 3, 0],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 3],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 4],
    [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
  ];

  final n = data.length;

  List<Map> states = List.filled(n, {});
  states[n-1]= {"from":labels.last,"to":'',"cost":0};

  for (int i = n-2; 0 <= i ; i--){
    states[i]= {"from":labels[i],"to":labels[i+1],"cost":intMaxValue};
    for(int j = i+1; j < n; j++){
      if(data[i][j] == 0) continue;

      final newCost = data[i][j] + states[j]["cost"];

      if(newCost < states[i]["cost"]){
         states[i]["to"] = labels[j];
         states[i]["cost"] = newCost;
      }
    }
  }

  print("Minimum Cost: ${states[0]["cost"]}");
  
  print("Path");
  List path = List.filled(n, "");
  path[0]=labels[0];
  int i = 0;
  int j = 0;

  while(i < states.length){
    if(states[i]["from"]==path[j]){
      path[j+1] = states[i]["to"];
      print("${states[i]["from"]} --> ${states[i]["to"]}");
      j++;
    }
    i++;
  }

}