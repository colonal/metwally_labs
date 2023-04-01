void main(List<String> args) {
  String text_1 = "HELLOWORLD";
  String text_2 = "OHELOD";

  final n = text_1.length;
  final m = text_2.length;

  text_1 = " $text_1";
  text_2 = " $text_2";

  final dp =
      List.generate(m + 1, (index) => List.generate(n + 1, (index) => 0));

  for (int i = 0; i <= m; i++) {
    for (int j = 0; j <= n; j++) {
      if (i == 0 || j == 0) continue;

      if (text_2[i] == text_1[j]) {
        final topLeft = 1 + dp[i - 1][j - 1];
        dp[i][j] = topLeft;
      } else {
        final top = dp[i - 1][j];
        final left = dp[i][j - 1];

        dp[i][j] = top > left ? top : left;
      }
    }
  }

  for (var element in dp) {
    print(element);
  }

  String lcs = "";

  int i = m;
  int j = n;

  while (i > 0 && j > 0) {
    if (dp[i][j] > dp[i][j - 1]) {
      if (dp[i][j] == dp[i - 1][j]) {
        i--;
      } else {
        lcs = text_2[i] + lcs;
        i--;
        j--;
      }
    }else{
      j--;
    }
  }


  print("");
  print(lcs);
}
