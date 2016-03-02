void initializeVis() {
  initNodes();
  initNodeMap();
  initPaths();
  initPercentages();
  initPercentageMap();
  initColors();
  initPercentIDs();
}

void setUpVis() {
  calculateTimes();
  todd = new Traveler(paths, durations, travelerState, step);
  calculatePercentages();
}