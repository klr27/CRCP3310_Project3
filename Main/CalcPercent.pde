void calculateTotalTime() {
  for (int i=0; i < nodes.length - 1; i++) {
    totalTime += nodes[i].totalTime;
  }
  totalTime += transport.totalTime;
}

void calculateTimeForPercent() {
   for (int i=0; i < nodes.length - 1; i++) {
    String area = percentageMap.get(nodes[i].name);
    if (area == "US") {
      percentages[US] += nodes[i].totalTime;
    } else if (area == "Europe") {
      percentages[EUROPE] += nodes[i].totalTime;
    } else if (area == "Asia") {
      percentages[ASIA] += nodes[i].totalTime;
    } else {
      percentages[AUSTRALIA] += nodes[i].totalTime;
    }
  }
}

void calculatePercentages() {
  calculateTotalTime();
  calculateTimeForPercent();
  
  for (int i=2; i<6; i++) {
    percentages[i] = percentages[i] / totalTime * 100;
  }
  percentages[0] = nodes[nodeMap.get("Baltimore")].totalTime / totalTime * 100;
  percentages[1] = nodes[nodeMap.get("London")].totalTime / totalTime * 100;
  percentages[6] = transport.totalTime/totalTime * 100;
}