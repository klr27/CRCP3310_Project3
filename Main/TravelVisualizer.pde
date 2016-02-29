class TravelVisualizer {

  Node [] nodes;
  Path [] paths;
  Node transport;
  Traveler traveler;
  double [] durations;

  int [] indices = new int [2];
  int [] arrive1 = new int [4];
  int [] depart = new int[4];
  int [] arrive2 = new int[4];
  String zone1;
  String zone2;
  TimeCalculator city;
  TimeCalculator travel;
  PVector start;
  PVector end;

  TravelVisualizer(Node [] nodes, Path [] paths, Node transport) {
    this.nodes = nodes;
    this.paths = paths;
    this.transport = transport;
    durations = new double[totalSchedRows];
    initializeVis();
  }

  int [] getDateTimeInfo(String date, String time) {
    String [] dateList = split(date, '/');
    String [] timeList = split(time, ':');
    int [] dateTime = new int[4];
    dateTime[0] = int(dateList[0]);
    dateTime[1] = int(dateList[1]);
    dateTime[2] = int(timeList[0]);
    dateTime[3] = int(timeList[1]);

    return dateTime;
  }

  void initializeVis() {
    for (int i=0; i < totalSchedRows - 2; i++) {
      indices[0] = nodeMap.get(schedule.getString(i, "Location"));
      indices[1] = nodeMap.get(schedule.getString(i + 1, "Location"));
      
      nodes[indices[0]].timesVisited += 1;

      zone1 = nodes[indices[0]].timeZone;
      zone2 = nodes[indices[1]].timeZone;
      arrive1 = getDateTimeInfo(schedule.getString(i, "Arrival Date"), schedule.getString(i, "Arrival Time"));
      depart = getDateTimeInfo(schedule.getString(i, "Dep. Date"), schedule.getString(i, "Dep. Time"));
      arrive2 = getDateTimeInfo(schedule.getString(i+1, "Arrival Date"), schedule.getString(i+1, "Arrival Time"));
      
      city = new TimeCalculator(zone1, zone1, arrive1, depart);
      double cityTime = city.calculate();
      durations[i] = cityTime;
      nodes[indices[0]].totalTime += cityTime;
      
      travel = new TimeCalculator(zone1, zone2, depart, arrive2);
      double transportTime = travel.calculate();
      travelTime[i] = transportTime;
      transport.totalTime =+ transportTime;

      start = new PVector(nodes[indices[0]].location.x, nodes[indices[0]].location.y);
      end = new PVector(nodes[indices[1]].location.x, nodes[indices[1]].location.y);
      paths[i] = new Path(start, end, pathState);
    }
    
    int index = nodeMap.get(schedule.getString(totalSchedRows - 1, "Location"));
    String lastTZ = nodes[index].timeZone;
    
    nodes[index].timesVisited += 1;

    int [] lastArr = new int[4];
    int [] lastDep = new int[4];
    lastArr = getDateTimeInfo(schedule.getString(totalSchedRows-1, "Arrival Date"), schedule.getString(totalSchedRows-1, "Arrival Time"));
    lastDep = getDateTimeInfo(schedule.getString(totalSchedRows-1, "Dep. Date"), schedule.getString(totalSchedRows-1, "Dep. Time"));

    TimeCalculator lastTime = new TimeCalculator(lastTZ, lastTZ, lastArr, lastDep);
    double cityDuration = lastTime.calculate();
    durations[totalSchedRows - 1] = cityDuration;
    nodes[index].totalTime += cityDuration;
    
    traveler = new Traveler(paths, durations, travelerState);
  }
  
  

  void display() {
  }
}