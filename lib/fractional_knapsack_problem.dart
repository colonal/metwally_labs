class Item implements Comparable<Item> {
  late String name;
  late double value;
  late double weight;
  late double ratio;
  Item(this.name, this.value, this.weight) {
    ratio = value / weight;
  }

  @override
  int compareTo(Item other) {
    return ( other.ratio - ratio ).round();
  }
}

class Knapsack {
  double maxCapacity = 0;
  double currentCapacity = 0;
  double totalValue = 0;
  List<Item> item = [];

  Knapsack(this.maxCapacity);

  addItem(Item newItem) {
    if (newItem.weight > maxCapacity - currentCapacity) {
      final diff = maxCapacity - currentCapacity;
      newItem.weight = diff;
      newItem.value = diff * newItem.ratio;
    }

    item.add(newItem);
    currentCapacity += newItem.weight;
    totalValue += newItem.value;
  }
}

void main(List<String> args) {
  List<double> values = [4, 9, 12, 11, 6, 5];
  List<double> weights = [1, 2, 10, 4, 3, 5];
  List<Item> items = [];

  for (var i = 0; i < values.length; ++i) {
    Item newItem = Item("#$i", values[i], weights[i]);

    items.add(newItem);
  }

  items.sort();

  for (var element in items) {
    print("${element.name}  ${element.value}  ${element.weight}  ${element.ratio}");
  }

  final bag = Knapsack(12);

  int j = 0;
  while (bag.currentCapacity < bag.maxCapacity) {
    bag.addItem(items[j]);
    ++j;
  }

  print("=" * 10);
  print(bag.totalValue);
  print(bag.currentCapacity);
  for (var element in bag.item) {
    print("${element.name}  ${element.value}  ${element.weight}");
  }
}
