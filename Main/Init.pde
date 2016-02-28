void initNodes() {
  for (int i = 0; i < totalCIRows; i++) {
    String name = cityInfo.getString(i, "Location");
    float x = float(cityInfo.getString(i, "Latitude"));
    float y = float(cityInfo.getString(i, "Longitude"));
    PVector pos = new PVector(x, y);
    String zone = cityInfo.getString(i, "Time Zone");
    nodes[i] = new Node(name, pos, zone);
  }
}

void initTransportNode() {
  PVector transportPos = new PVector(0, 0);
  transport = new Node("Transport", transportPos, "N/A");
}