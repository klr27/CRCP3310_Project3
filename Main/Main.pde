// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

Table schedule;
Table cityInfo;

TimeCalculator calculator;

Node [] nodes;
Edge [] edges; 

final int NAME = 0;
final int ARR_TIME = 1;
final int ARR_DATE = 2;
final int DEP_TIME = 3;
final int DEP_DATE = 4;
final int LAT = 1;
final int LONG = 2;
final int TIME_ZONE = 3;

int totalCIRows;
int totalSchedRows;

//TimeCalculator check
String zone1;
String zone2;
int mon1;
int mon2;
int day1;
int day2;
int hour1;
int hour2;
int min1;
int min2;

void setup() {
  //size(1200, 700);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  nodes = new Node[totalCIRows];
  edges = new Edge[totalSchedRows - 1];
  initNodes();

  //check TimeCalculator
  zone1 = "US/Eastern";
  zone2 = "Europe/London";
  mon1 = 1;
  mon2 = 1;
  day1 = 1;
  day2 = 2;
  hour1 = 2;
  hour2 = 0;
  min1 = 0;
  min2 = 0;
  
  calculator = new TimeCalculator(zone1, zone1, mon1, mon2, day1, day2, hour1, hour2, min1, min2);
  double hours = calculator.calculate();
  println(hours);
}

void draw() {
}