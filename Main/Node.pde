class Node {

  String name;
  PVector location;
  String timeZone;
  int state;
  int timesVisited;
  double totalTime;

  Node(String name, PVector location, String timeZone, int state) {
    this.name = name;
    this.location = location;
    this.timeZone = timeZone;
    this.state = state;
    timesVisited = 0;
    totalTime = 0.0;
  }

  void display(double wholeTime) {
    stroke(255);
    fill(255);
    ellipseMode(CENTER);
    if (state == BY_DURATION) {
      double diameter = totalTime/wholeTime * 50;
      ellipse(location.x, location.y, (float)diameter, (float)diameter);
    } else {
      ellipse(location.x, location.y, 5, 5);
    }
  }
}