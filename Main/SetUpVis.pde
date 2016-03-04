void initNodes() {
  nodes = new Node[totalCIRows];
  for (int i = 0; i < totalCIRows; i++) {
    String name = cityInfo.getString(i, "Location");
    float x = float(cityInfo.getString(i, "Longitude"));
    float y = float(cityInfo.getString(i, "Latitude"));
    float mapx = map(x, -180, 180, 0, 1200);
    float mapy = map(y, 90, -90, 0, 600);
    PVector pos = new PVector(mapx, mapy);
    String zone = cityInfo.getString(i, "Time Zone");
    nodes[i] = new Node(name, pos, zone);
    
    PVector transportPos = new PVector(0, 0);
    transport = new Node("Transport", transportPos, "N/A");
    transport.timesVisited = totalSchedRows-1;
  }
}

void initNodeMap() {
  for (int i=0; i < nodes.length; i++) {
    nodeMap.put(nodes[i].name, i);
  }
  
  println(nodeMap);
}

int getIndex(int rowNum) {
  int index = nodeMap.get(schedule.getString(rowNum, "Location")); 
  println(index);
  return index;
}

void initPaths() {
  paths = new Path[totalSchedRows - 1];
  for (int i=0; i < totalSchedRows - 2; i++) {
    PVector start = new PVector(nodes[getIndex(i)].location.x, nodes[getIndex(0)].location.y);
    PVector end = new PVector(nodes[getIndex(i+1)].location.x, nodes[getIndex(i+1)].location.y);
    paths[i] = new Path(start, end);
  }
}

void initPercentageMap() {
  for (int i=0; i < nodes.length; i++) {
    String [] list = split(nodes[i].timeZone, '/');
    percentageMap.put(nodes[i].name, list[0]);
  }
}

void initColors() {
  colors = new color[6];
  colors[0] = color(255, 0, 0);
  colors[1] = color(255, 188, 0);
  colors[2] = color(255, 247, 0);
  colors[3] = color(2, 203, 0);
  colors[4] = color(0, 232, 255);
  colors[5] = color(152, 26, 255);
}

void initPercentages() {
  percentages = new double[7];
  for(int i=0; i<6; i++) {
    percentages[0] = 0.0;
  }
}

void initPercentIDs() {
  percentIDs = new String[7];
  percentIDs[0] = "% of year at home: ";
  percentIDs[1] = "% of year in London: ";
  percentIDs[2] = "% of year in the US: ";
  percentIDs[3] = "% of year in Europe: ";
  percentIDs[4] = "% of year in Asia: ";
  percentIDs[5] = "% of in Australia: ";
  percentIDs[6] = "% of year in transport: ";
}

void initializeVis() {
  initNodes();
  initNodeMap();
  initPaths();
  initPercentages();
  initPercentageMap();
  initColors();
  initPercentIDs();
  durations = new double[totalSchedRows];
}

void setUpVis() {
  calculateTimes();
  calculatePercentages();
}