class TravelVisualizer {

  Node [] nodes;
  Path [] paths;
  Parser parser;
  //Traveler traveler

  TravelVisualizer(Node [] nodes, Path [] paths, Parser parser) {
    this.nodes = nodes;
    this.paths = paths;
    this.parser = parser;
  }

  void setupVis() {
    for (int i=0; i < totalSchedRows - 2; i++) {
      // want to calculate duration
      // create path
      int [] indices = new int [2];
      for (int i=0; i<2; i++) {
       indices[i] = parser.getNodeIndex(schedule.getString(i, "Location");
      }
      int [] city1Arr;
      int [] city1Dep;
      int [] city2Arr;
      
      
    }
  }
}