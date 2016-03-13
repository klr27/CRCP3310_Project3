// Project 3: Consuming Structured Data //<>//
// Visualization of my Dad's travel over 2015
// Kali Ruppert

import java.util.Map;

Table schedule;
Table cityInfo;

HashMap<String, Integer> nodeMap = new HashMap<String, Integer>();
HashMap<String, String> percentageMap = new HashMap<String, String>();

PImage map;

PFont title;
PFont cityStatHeader;
PFont cityStatText;
PFont header;
PFont text;

Node [] nodes;
Path [] paths; 
Node transport;

double [] durations;
color [] colors;

double totalTime;
double [] countryTimes;
double [] percentages;
String [] percentIDs;
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
final int BLACK = 0;
final int COLOR = 1; 

int nodeState;
final int BY_DURATION = 0;
final int ALL_SAME = 1;

int percentState;
int stepState;
final int SHOW = 0;
final int HIDE = 1;

int step;

void setup() {
  size(1200, 700);

  map = loadImage("world.jpg");
  map.resize(1200, 600);

  title = createFont("MyriadPro-Bold", 24);
  cityStatHeader = createFont("MyriadPro-Bold", 20);
  cityStatText = createFont("MyriadPro-Regular", 14);
  header = createFont("MyriadPro-Semibold", 14);
  text = createFont("MyriadPro-Regular", 12);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  travelerState = COLOR;
  nodeState = BY_DURATION;
  percentState = SHOW;
  stepState = SHOW;
  step = 0;

  initializeVis();
  setUpVis();
}

void draw() {
  background(225);
  drawVis();
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == RIGHT) {
      if (step != totalSchedRows - 1) {
        step += 1;
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

  if (key == 'c' || key == 'C') {
    travelerState = (travelerState + 1) % 2;
  }

  if (key == 'd' || key == 'D') {
    nodeState = (nodeState + 1) % 2;
  }

  if (key == 'p' || key == 'P') {
    percentState = (percentState + 1) % 2;
  }

  if (key == 's' || key == 'S') {
    stepState = (stepState + 1) % 2;
  }
}