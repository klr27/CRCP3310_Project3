class Node {
  
  String name;
  PVector location;
  int timesVisited;
  long totalTimeThere;
  
  Node(String name, PVector location){
    this.name = name;
    this.location = location;
    totalTimeThere = 50;
  }
  
}