// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

import java.util.Map;

Table schedule;
Table cityInfo;

TravelVisualizer travelVis;

Node [] nodes;
Path [] paths; 
Node transport;

HashMap<String,Integer> nodeMap = new HashMap<String,Integer>();

PImage map;

int totalCIRows;
int totalSchedRows;

int pathState;
int travelerState;
final int BLACK_STATE = 0;
final int COLOR_STATE = 1; 
final int NO_FILL_STATE = 2;

void setup() {
  //size(1200, 700);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  nodes = new Node[totalCIRows];
  paths = new Path[totalSchedRows - 1];
  initNodes();
  initHashMap();
  /*for (Map.Entry me : nodeMap.entrySet()) {
  println(me.getKey());
  println(me.getValue());
}*/
  
  travelVis = new TravelVisualizer(nodes, paths, transport);
  travelVis.initializeVis();
  
  pathState = BLACK_STATE;
  travelerState = BLACK_STATE;
  
 /* for (int i=0; i < totalCIRows -1; i++) {
    println(travelVis.nodes[i].name);
    println(travelVis.nodes[i].location);
    println(travelVis.nodes[i].timesVisited);
    println(travelVis.nodes[i].totalTime);
    println(travelVis.nodes[i].timeZone);
  }*/
}

void draw() {
}