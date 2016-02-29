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

double [] travelTime;

HashMap<String, Integer> nodeMap = new HashMap<String, Integer>();

PImage map;

int totalCIRows;
int totalSchedRows;

int travelerState;
final int BLACK_STATE = 0;
final int COLOR_STATE = 1; 
final int NO_FILL_STATE = 2;

int nodeState;
final int BY_DURATION = 0;
final int ALL_SAME = 1;

int pathState;
final int SHOW = 0;
final int HIDE = 1;

void setup() {
  //size(1200, 700);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  travelerState = BLACK_STATE;
  nodeState = BY_DURATION;
  pathState = SHOW;
  
  nodes = new Node[totalCIRows];
  paths = new Path[totalSchedRows - 1];
  initNodes();
  initHashMap();

  travelTime = new double[totalSchedRows - 1];

  travelVis = new TravelVisualizer(nodes, paths, transport);
  travelVis.initializeVis();
}

void draw() {
}