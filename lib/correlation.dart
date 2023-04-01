import 'dart:io' as io;
import 'dart:math' as math;

void main(List<String> args) {
  double n = 0,
      sy = 0,
      sx = 0,
      sxy = 0,
      up = 0,
      xpow2 = 0,
      ypow2 = 0,
      a1 = 0,
      a2 = 0,
      down = 0,
      correlation = 0;

  List<double> x = [];
  List<double> y = [];

  io.stdout.write("n=");
  n = double.tryParse(io.stdin.readLineSync() ?? "1") ?? 1;

  for (int i = 0; i < n; ++i) {
    io.stdout.write("x[$i]=");
    x.add(double.tryParse(io.stdin.readLineSync() ?? "1") ?? 1);
  }

  for (int i = 0; i < n; ++i) {
    io.stdout.write("y[$i]=");
    y.add(double.tryParse(io.stdin.readLineSync() ?? "1") ?? 1);
  }

  for (var i = 0; i < n; i++) {
    sx += x[i];
    sy += y[i];
    sxy += x[i] * y[i];
    xpow2 += math.pow(x[i], 2).toInt();
    ypow2 += math.pow(y[i], 2).toInt();
  }

  up = (n * sxy) - (sx * sy);

  a1 = math.sqrt(n * xpow2 - math.pow(sx, 2));
  a2 = math.sqrt(n * ypow2 - math.pow(sy, 2));

  down = a1 * a2;

  correlation = up / down;

  print("correlation: $correlation");
}
