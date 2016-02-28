// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

Table schedule;
Table cityInfo;

Parser parser;

Node [] nodes;
Path [] paths; 

int totalCIRows;
int totalSchedRows;


void setup() {
  //size(1200, 700);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  nodes = new Node[totalCIRows];
  paths = new Path[totalSchedRows - 1];
  initNodes();

  parser = new Parser(nodes);
}

void draw() {
}