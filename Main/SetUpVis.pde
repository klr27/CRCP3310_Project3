void initializeVis() {
  initNodes();
  initNodeMap();
  initPaths();
  initPercentages();
  initPercentageMap();
  initColors();
  initPercentNames();
}

void setUpVis() {
  calculateTimes();
  todd = new Traveler(paths, durations, travelerState, step);
  calculatePercentages();
}