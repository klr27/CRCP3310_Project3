class Node {

  String name;
  PVector location;
  String timeZone;
  int timesVisited;
  double totalTime;
  int state;

  Node(String name, PVector location, String timeZone, int state) {
    this.name = name;
    this.location = location;
    this.timeZone = timeZone;
    this.state = state;
    timesVisited = 0;
    totalTime = 0.0;
  }

  void display() {
    stroke(0);
    fill(0);
    ellipseMode(CENTER);
    if (state == BY_DURATION) {
      ellipse(location.x, location.y, (float)totalTime, (float)totalTime);
    } else {
      ellipse(location.x, location.y, 10, 10);
    }
  }
}