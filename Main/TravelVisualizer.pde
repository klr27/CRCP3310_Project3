class TravelVisualizer {

  Node [] nodes;
  Path [] paths;
  Parser parser;
  Node transport;
  //Traveler traveler

  int [] indices = new int [2];
  int [] arrive1 = new int [4];
  int [] depart = new int[4];
  int [] arrive2 = new int[4];
  String [] z1 = new String [2];
  String [] z2 = new String [2];
  TimeCalculator city;
  TimeCalculator travel;
  PVector start;
  PVector end;

  TravelVisualizer(Node [] nodes, Path [] paths, Parser parser, Node transport) {
    this.nodes = nodes;
    this.paths = paths;
    this.parser = parser;
    this.transport = transport;
  }

  void initializeVis() {
    for (int i=0; i < totalSchedRows - 2; i++) {
      indices[0] = parser.getNodeIndex(schedule.getString(i, "Location"));
      indices[1] = parser.getNodeIndex(schedule.getString(i+1, "Location"));

      println(indices);

      z1[0] = nodes[indices[0]].timeZone;
      z1[1] = z2[0] = z1[0];
      z2[1] = nodes[indices[1]].timeZone;

      println(z1[0]);
      println(z1[1]);
      println(z2[0]);
      println(z2[1]);

      arrive1 = parser.getDateTimeInfo(schedule.getString(i, "Arrival Date"), schedule.getString(i, "Arrival Time"));
      println(arrive1);

      depart = parser.getDateTimeInfo(schedule.getString(i, "Dep. Date"), schedule.getString(i, "Dep. Time"));
      println(depart);

      arrive2 = parser.getDateTimeInfo(schedule.getString(i+1, "Arrival Date"), schedule.getString(i+1, "Arrival Time"));
      println(arrive2);

      city = new TimeCalculator(z1, arrive1, depart);
      nodes[indices[0]].totalTime += city.calculate();
      println(nodes[indices[0]].totalTime);

      travel = new TimeCalculator(z2, depart, arrive2);
      transport.totalTime =+ travel.calculate();
      println(transport.totalTime);

      start = new PVector(nodes[indices[0]].location.x, nodes[indices[0]].location.y);
      end = new PVector(nodes[indices[1]].location.x, nodes[indices[1]].location.y);

      println(start);
      println(end);

      paths[i] = new Path(start, end);
    }
    int index = parser.getNodeIndex(schedule.getString(totalSchedRows - 1, "Location"));
    int [] lastDepart = new int[4];
    lastDepart = parser.getDateTimeInfo(schedule.getString(totalSchedRows-1, "Dep. Date"), schedule.getString(totalSchedRows-1, "Dep. Time"));
    String [] lastTZ = new String[2];
    lastTZ[0] = lastTZ[1] = nodes[index].timeZone;
    TimeCalculator lastTime = new TimeCalculator(lastTZ, arrive2, lastDepart);
    nodes[index].totalTime += lastTime.calculate();
  }
}