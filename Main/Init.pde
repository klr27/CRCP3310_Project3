  void initNodes() {
    for (int i = 0; i < totalCIRows; i++) {
      String name = cityInfo.getString(i, "Location");
      float x = float(cityInfo.getString(i, "Longitude"));
      float y = float(cityInfo.getString(i, "Latitude"));
      float mapx = map(x, -180, 180, 0, 1200);
      float mapy = map(y, -90, 90, 0, 600);
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

void initPercentageMap() {
  for (int i=0; i < nodes.length; i++) {
    String [] list = split(nodes[i].timeZone, '/');
    percentageMap.put(nodes[i].name, list[0]);
  }
}