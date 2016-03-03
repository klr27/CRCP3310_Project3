class Path {

  PVector start;
  PVector end;

  Path(PVector start, PVector end) {
    this.start = start;
    this.end = end;
  }

  void display() {
    stroke(0);
    fill(0);
    line(start.x, start.y, end.x, end.y);
  }