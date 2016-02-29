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

  void display() {
    if (step != 0) {
      paths[step - 1].display();
    }
    if (state == BLACK_STATE) { //<>//
      stroke(0);
      fill(0);
    } else {
      stroke(0);
      fill(150);
      rect(700, 610, 350, 80);
      stroke(255, 0, 0);
      fill(255, 0, 0);
      text("Trip duration = 0 - 6 hours", 700, 630);
      stroke(255, 188, 0);
      fill(255, 188, 0);
      text("Trip duration = 6 - 24 hours", 700, 650);
      stroke(255, 247, 0);
      fill(255, 247, 0);
      text("Trip duration = 1 - 2 days", 700, 670);
      stroke(2, 203, 0);
      fill(2, 203, 0);
      text("Trip duration = 2 - 4 days", 850, 630);
      stroke(0, 232, 255);
      fill(0, 232, 255);
      text("Trip duration = 4 - 7 days", 850, 650);
      stroke(162, 26, 255);
      fill(162, 26, 255);
      text("Trip duration = more than a week", 850, 670);

      if (duration[step] <= 6) {
        stroke(255, 0, 0);
        fill(255, 0, 0);
      } else if ((duration[step] > 6) && (duration[step] <= 24)) {
        stroke(255, 188, 0);
        fill(255, 188, 0);
      } else if ((duration[step] > 24) && (duration[step] <= 48)) {
        stroke(255, 247, 0);
        fill(255, 247, 0);
      } else if ((duration[step] > 48) && (duration[step] <= 96)) {
        stroke(2, 203, 0);
        fill(2, 203, 0);
      } else if ((duration[step] > 96) && (duration[step] <= 168)) {
        stroke(0, 232, 255);
        fill(0, 232, 255);
      } else {
        stroke(162, 26, 255);
        fill(162, 26, 255);
      }
    }
    ellipseMode(CENTER);
    if (step != totalSchedRows - 1) {
      ellipse(paths[step].start.x, paths[step].start.y, DIAMETER, DIAMETER);
    } else {

      ellipse(paths[step].end.x, paths[step].end.y, DIAMETER, DIAMETER);
    }
  }
}