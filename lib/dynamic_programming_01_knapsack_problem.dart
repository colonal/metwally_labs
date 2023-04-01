import 'dart:math';

void main(List<String> args) {
  final items = [
    {"name": "#1", "weight": 1, "profit": 4},
    {"name": "#2", "weight": 3, "profit": 9},
    {"name": "#3", "weight": 5, "profit": 12},
    {"name": "#4", "weight": 4, "profit": 11}
  ];

  const maxWeight = 8;


  items.insert(0, {"name": "#0", "weight": 0, "profit": 0});

  final dp = List.generate(items.length, (index) => List.generate(maxWeight+1, (index) => 0));

  for (int i =1; i < items.length; i++){
    for (int j=1; j <= maxWeight; j++){

      if((items[i]["weight"] as int) <= j){
        dp[i][j] = max(
          dp[i-1][j],
          (items[i]["profit"] as int)+dp[i-1][j- (items[i]["weight"] as int)]
          );

      }else{
        dp[i][j]= dp[i-1][j];
      }
    }
  }

  for (var element in dp) {
    print(element);
  }
  print("\nMax Profit: ${dp[items.length-1][maxWeight]}");


  final solution = [];

  int i = items.length -1;
  int j = maxWeight;


  while( j > 0){
    if(dp[i][j] > dp[i-1][j]){
      solution.add(items[i]["name"]);
      j -= items[i]["weight"] as int;
      i -- ;
    }else{
      i -- ;
    }
  }

  print(solution);
}
