class Node {

  String name;
  PVector location;
  String timeZone;
  int timesVisited;
  double totalTime;

  Node(String name, PVector location, String timeZone) {
    this.name = name;
    this.location = location;
    this.timeZone = timeZone;
    timesVisited = 0;
    totalTime = 0.0;
  }

  void displayByDuration(double wholeTime) {
    stroke(255, 100);
    fill(255, 100);
    ellipseMode(CENTER);
    double diameter = totalTime/wholeTime * 100;
    ellipse(location.x, location.y, (float)diameter, (float)diameter);
  }
  
  void displayTheSame() {
    stroke(255);
    fill(255);
    ellipseMode(CENTER);
    ellipse(location.x, location.y, 7, 7);
  }
}