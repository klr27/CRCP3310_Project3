void initNodes() {
  for (int i = 0; i < totalCIRows; i++) {
    String name = cityInfo.getString(i, "Location");
    float y = float(cityInfo.getString(i, "Latitude"));
    float x = float(cityInfo.getString(i, "Longitude"));
    float mapx = map(x, -180, 180, 0, 1200);
    float mapy = map(y, -90, 90, 0, 600);
    PVector pos = new PVector(mapx, mapy);
    String zone = cityInfo.getString(i, "Time Zone");
    nodes[i] = new Node(name, pos, zone);
  }
}

void initTransportNode() {
  PVector transportPos = new PVector(0, 0);
  transport = new Node("Transport", transportPos, "N/A");
  transport.timesVisited = totalSchedRows-1;
}