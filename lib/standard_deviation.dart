import 'dart:io';
import 'dart:math' as math;

void main(List<String> args) {
  int sumAva = 0, n = 0, a = 0;
  double ava = 0, sd = 0, b = 0;
  List<int> x = [];

  stdout.write("n=?:");
  n = int.tryParse(stdin.readLineSync() ?? "1") ?? 1;

  for (var i = 0; i < n; i++) {
    stdout.write("x[$i]=");
    x.add(int.tryParse(stdin.readLineSync() ?? "1") ?? 1);
    sumAva += x.last;
  }

  ava = sumAva / n;

  for (var i = 0; i < n; i++) {
    a += math.pow(x[i] - ava, 2).toInt();
  }

  b = a / n;
  sd = math.sqrt(b);

  print(sd);
}
