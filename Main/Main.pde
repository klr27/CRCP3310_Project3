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
HashMap<String, String> percentageMap = new HashMap<String, String>();

PImage map;

int totalCIRows;
int totalSchedRows;

int travelerState;
final int BLACK_STATE = 0;
final int COLOR_STATE = 1; 

int nodeState;
final int BY_DURATION = 0;
final int ALL_SAME = 1;

int pathState;
final int SHOW = 0;
final int HIDE = 1;

int stepState;
final int SHOW_ALL = 0;
final int STEP_BY_STEP = 1;

int step;

void setup() {
  //size(1200, 700);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  travelerState = BLACK_STATE;
  nodeState = BY_DURATION;
  pathState = SHOW;
  stepState = SHOW_ALL;
  step = 0;

  nodes = new Node[totalCIRows];
  paths = new Path[totalSchedRows - 1];
  initNodes();
  initNodeMap();
  initPercentageMap();

  travelTime = new double[totalSchedRows - 1];

  travelVis = new TravelVisualizer(nodes, paths, transport, stepState);
  travelVis.initializeVis();
}

void draw() {
}

void keyPressed() {
  if (key == RIGHT) {
    if (step == totalSchedRows - 1) {
      step = 0;
    } else {
      step += 1;
    }
  }
  
  if (key == LEFT) {
    if (step == 0) {
      step = totalSchedRows - 1;
    } else {
      step -= 1;
    }
  }
}