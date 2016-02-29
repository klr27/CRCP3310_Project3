class Path {

  PVector start;
  PVector end;
  int state;

  Path(PVector start, PVector end, int state) {
    this.start = start;
    this.end = end;
    this.state = state;
  }

  void display() {
    if (state == SHOW) {
      stroke(0);
      fill(0);
    } else {
      noStroke();
      noFill();
    }
    line(start.x, start.y, end.x, end.y);
  }
}