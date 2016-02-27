class Node {
  
  String name;
  PVector location;
  int timeZone;
  int timesVisited;
  long totalTimeThere;
  
  Node(String name, PVector location, int timeZone){
    this.name = name;
    this.location = location;
    this.timeZone = timeZone;
    //totalTimeThere = 50;
  }
  
}