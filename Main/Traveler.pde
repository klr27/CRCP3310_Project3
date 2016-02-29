class Traveler {
  
  double [] duration;
  Path [] paths;
  final int DIAMETER = 50;
  int state;
  
  Traveler(Path [] paths, double [] duration, int state) {
    this.paths = paths;
    this.duration = duration;
    this.state = state;
    duration = new double[totalSchedRows];
  }
  
  void drawTraveler() {
    noStroke();
    
    for (int i=0; i < paths.length -1; i++) {
    }
  }
}