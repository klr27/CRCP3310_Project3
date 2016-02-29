class Traveler {
  
  double [] duration;
  Path [] paths;
  final int DIAMETER = 50;
  color [] c;
  int state;
  
  Traveler(Path [] paths, color [] c, int state) {
    this.paths = paths;
    this.c = c;
    this.state = state;
    duration = new double[totalSchedRows];
  }
  
  void drawTraveler() {
    noStroke();
    
    for (int i=0; i < paths.length -1; i++) {
    }
  }
}