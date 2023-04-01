class Vertex {
  final String name;

  List<Edge>? vertexLinks;

  double totalLength;
  Vertex? sourceOfTotalLength;

  Vertex({
    required this.name,
    this.totalLength = double.maxFinite,
    this.sourceOfTotalLength,
  }) : vertexLinks = [];
}

class Edge {
  double weight;
  Vertex source;
  Vertex target;
  Edge({
    required this.source,
    required this.target,
    this.weight = 0,
  });
}

class Graph {
  List<Vertex> vertices = [];

  Graph(List<String> names) {
    for (var name in names) {
      vertices.add(Vertex(name: name));
    }
  }

  void addEdges(int vertexIndex, List<int> target, List<double> weight) {
    for (var i = 0; i < target.length; i++) {
      vertices[vertexIndex].vertexLinks?.add(
            Edge(
              source: vertices[vertexIndex],
              target: vertices[target[i]],
              weight: weight[i],
            ),
          );
    }
  }

  void dijkstra() {
    late Vertex currentVertex;
    vertices[0].totalLength = 0;
    for (var i = 0; i < vertices.length; i++) {
      currentVertex = vertices[i];
      List<Edge>? destinations = currentVertex.vertexLinks;
      if (destinations == null) continue;

      late Edge currentEdge;
      for (var j = 0; j < destinations.length; j++) {
        currentEdge = destinations[j];
        final newLength = currentVertex.totalLength + currentEdge.weight;
        if (newLength < currentEdge.target.totalLength) {
          currentEdge.target.totalLength = newLength;
          currentEdge.target.sourceOfTotalLength = currentVertex;
        }
      }
    }

    String path = vertices[vertices.length - 1].name;
    Vertex v = vertices[vertices.length - 1];

    while (v.sourceOfTotalLength != null) {
      path = "${v.sourceOfTotalLength!.name}-$path";

      v = v.sourceOfTotalLength!;
    }

    print(vertices[vertices.length - 1].totalLength);
    print(path);

    restoreVertices();
  }

  void restoreVertices() {
    for (var element in vertices) {
      element.totalLength = double.maxFinite;
      element.sourceOfTotalLength = null;
    }
  }
}

void main(List<String> args) {
  Graph g = Graph(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]);
  g.addEdges(0, [1, 2, 3], [2, 4, 3]);

  g.addEdges(1, [4, 5, 6], [7, 4, 6]);
  g.addEdges(2, [4, 5, 6], [3, 2, 4]);
  g.addEdges(3, [4, 5, 6], [4, 1, 5]);

  g.addEdges(4, [7, 8], [1, 4]);
  g.addEdges(5, [7, 8], [6, 3]);
  g.addEdges(6, [7, 8], [3, 3]);

  g.addEdges(7, [9], [3]);
  g.addEdges(8, [9], [4]);

  g.dijkstra();
}
