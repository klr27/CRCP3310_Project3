void initNodes() {
  for (int i = 0; i < totalCIRows; i++) {
    String name = cityInfo.getString(i, "Location");
    float x = float(cityInfo.getString(i, "Longitude"));
    float y = float(cityInfo.getString(i, "Latitude"));
    float mapx = map(x, -180, 180, 0, 1200);
    float mapy = map(y, 90, -90, 0, 600);
    PVector pos = new PVector(mapx, mapy);
    String zone = cityInfo.getString(i, "Time Zone");
    nodes[i] = new Node(name, pos, zone, nodeState);

    PVector transportPos = new PVector(0, 0);
    transport = new Node("Transport", transportPos, "N/A", nodeState);
    transport.timesVisited = totalSchedRows-1;
  }
}

void initNodeMap() {
  for (int i=0; i < nodes.length; i++) {
    nodeMap.put(nodes[i].name, i);
  }
}

int getIndex(int rowNum) {
  return nodeMap.get(schedule.getString(rowNum, "Location"));
}

void initPaths() {
  for (int i=0; i < totalSchedRows - 2; i++) {
    PVector start = new PVector(nodes[getIndex(i)].location.x, nodes[getIndex(0)].location.y);
    PVector end = new PVector(nodes[getIndex(i+1)].location.x, nodes[getIndex(i+1)].location.y);
    paths[i] = new Path(start, end, pathState);
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

void initPercentNames() {
  percentNames = new String[7];
  percentNames[0] = "Percentage of the year at home:";
  percentNames[1] = "Percentage of the year in London:";
  percentNames[2] = "Percentage of the year in the US:";
  percentNames[3] = "Percentage of the year in Europe:";
  percentNames[4] = "Percentage of the year in Asia:";
  percentNames[5] = "Percentage of the year in Australia:";
  percentNames[0] = "Percentage of the year in transport:";
}