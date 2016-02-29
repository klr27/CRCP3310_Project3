class Traveler {

  double [] duration;
  Path [] paths;
  final int DIAMETER = 10;
  int state;
  int step;

  Traveler(Path [] paths, double [] duration, int state, int step) {
    this.paths = paths;
    this.duration = duration;
    this.state = state;
    this.step = step;
    duration = new double[totalSchedRows];
  }

  void displayTraveler() {
    if (step != 0) {
      paths[step - 1].display();
    }
    if (state == BLACK_STATE) {
      stroke(0);
      fill(0);
    } else {
      if (duration[state] <= 4) {
        stroke(255, 0, 0);
        fill(255, 0, 0);
      } else if ((duration[state] > 4) && (duration[state] <= 24)) {
        stroke(255, 188, 0);
        fill(255, 188, 0);
      } else if ((duration[state] > 24) && (duration[state] <= 48)) {
        stroke(255, 247, 0);
        fill(255, 247, 0);
      } else if ((duration[state] > 48) && (duration[state] <= 96)) {
        stroke(2, 203, 0);
        fill(2, 203, 0);
      } else if ((duration[state] > 96) && (duration[state] <= 168)) {
        stroke(0, 232, 255);
        fill(0, 232, 255);
      } else {
        stroke(162, 26, 255);
        fill(162, 26, 255);
      }
    }
    ellipseMode(CENTER);
    if (step == totalSchedRows - 1) {
      ellipse(paths[step].end.x, paths[step].end.y, DIAMETER, DIAMETER);
    } else {
      ellipse(paths[step].start.x, paths[step].start.y, DIAMETER, DIAMETER);
    }
  }
}