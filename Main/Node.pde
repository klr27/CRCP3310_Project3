class Node {
  
  String name;
  PVector location;
  String timeZone;
  int timesVisited;
  double totalTime;
  
  Node(String name, PVector location, String timeZone){
    this.name = name;
    this.location = location;
    this.timeZone = timeZone;
    timesVisited = 0;
    totalTime = 0.0;
  }
 
}