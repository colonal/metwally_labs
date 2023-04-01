
class Vertex {
  final String name;
  bool visited;
  List<Edge> vertexLinks;

  Vertex({
    required this.name,
    this.visited = false,
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

  void addEdges(int vertexIndex, List<int> target) {
    for (var i = 0; i < target.length; i++) {
      vertices[vertexIndex].vertexLinks.add(
          Edge(source: vertices[vertexIndex], target: vertices[target[i]]));
    }
  }

  

  void dfs() {
    dfsRecursion(vertices[0]);
    restoreVertices();
  }

  void dfsRecursion(Vertex currentVertex) {
    currentVertex.visited = true;
    final destinations = currentVertex.vertexLinks;

    for (var i = 0; i < destinations.length; i++) {
      if(!destinations[i].target.visited){
        print("${currentVertex.name} - ${destinations[i].target.name}");
      dfsRecursion(destinations[i].target);
      }
    }
  }


  void restoreVertices() {
    for (var element in vertices) {
      element.visited = false;
    }
  }
}

void main(List<String> args) {
  Graph g = Graph(["A", "B", "C", "D", "E", "F", "G", "H", "I"]);
  g.addEdges(0, [1, 2]);
  g.addEdges(1, [0, 3, 4]);
  g.addEdges(2, [0, 3, 5]);
  g.addEdges(3, [1, 2, 4]);
  g.addEdges(4, [1, 5]);
  g.addEdges(5, [2, 3, 4, 7]);
  g.addEdges(6, [7, 8]);
  g.addEdges(7, [5, 6, 8]);
  g.addEdges(8, [6, 7]);
  g.dfs();
}
