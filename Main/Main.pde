// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

import java.util.Map;

Table schedule;
Table cityInfo;

HashMap<String, Integer> nodeMap = new HashMap<String, Integer>();
HashMap<String, String> percentageMap = new HashMap<String, String>();

PImage map;

//TravelVisualizer travelVis;
Node [] nodes;
Path [] paths; 
Node transport;

Traveler todd;
double [] durations;
color [] colors;

double totalTime;
double [] percentages;
String [] percentNames;
final int HOME = 0;
final int LONDON = 1;
final int US = 2;
final int EUROPE = 3;
final int ASIA = 4;
final int AUSTRALIA = 5;
final int TRAVEL = 6;

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
  size(1200, 700);

  map = loadImage("world.jpg");
  map.resize(1200, 600);
  
  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount(); //<>//

  travelerState = COLOR_STATE;
  nodeState = BY_DURATION;
  pathState = SHOW;
  stepState = STEP_BY_STEP;
  step = 0;

  durations = new double[totalSchedRows];
  percentages = new float[6];
  
  nodes = new Node[totalCIRows];
  paths = new Path[totalSchedRows - 1];
  initNodes();
  initNodeMap();
  initPercentageMap();

  travelVis = new TravelVisualizer(nodes, paths, transport, stepState);
  travelVis.initializeVis();

  for (int i=0; i<nodes.length - 1; i++) {
    println(nodes[i].name);
    println(nodes[i].location);
    println(nodes[i].timeZone);
    println(nodes[i].totalTime);
    println(nodes[i].timesVisited);
  }
}

void draw() {
  background(225);
  image(map, 0, 0);
  travelVis.display();
  println(step);
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (step != totalSchedRows - 1) {
        traveler.step += 1;
      } else {
        step = 0;
      }
    }
    if (keyCode == LEFT) {
      if (step != 0) {
        step -= 1;
      } else {
        step = totalSchedRows - 1;
      }
    }
  }

  if (key == 's' || key == 'S') {
    if (pathState == SHOW) {
      pathState = HIDE;
    } else {
      pathState = SHOW;
    }
  }

  if (key == 'c' || key == 'C') {
    if (travelerState == BLACK_STATE) {
      travelerState = COLOR_STATE;
    } else {
      travelerState = BLACK_STATE;
    }
  }

  if (key == 'd' || key == 'D') {
    if (nodeState == BY_DURATION) {
      nodeState = ALL_SAME;
    } else {
      nodeState = BY_DURATION;
    }
  }

  if (key == ' ') {
    if (stepState == SHOW_ALL) {
      nodeState = STEP_BY_STEP;
    } else {
      nodeState = SHOW_ALL;
    }
  }
}