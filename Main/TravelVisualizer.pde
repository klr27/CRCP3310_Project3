class TravelVisualizer {

  Node [] nodes;
  Edge [] edges;
  //Traveler traveler

  TravelVisualizer(Node [] nodes, Edge [] edges) {
    this.nodes = nodes;
    this.edges = edges;
  }

  int getNode(String name) {
    int index = 0;
    for (int i=0; i < nodes.length - 1; i++) {
      if (nodes[i].name == name) {
        index = i;
      }
    }
    return index;
  }
  
  
  
  void setupVis() {
    for (int i=0; i < totalSchedRows - 2; i++) {
    }
  }
}