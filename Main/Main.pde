// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

/*import java.util.TimeZone;
import java.util.SimpleTimeZone;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.Date;
*/

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
int zone1;
int zone2;
int mon1;
int mon2;
int day1;
int day2;
int hour1;
int hour2;
int min1;
int min2;

void setup() {
  size(1200, 700);

  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");

  totalSchedRows = schedule.getRowCount();
  totalCIRows = cityInfo.getRowCount();

  nodes = new Node[totalCIRows];
  initNodes();

  //check TimeCalculator
  zone1 = -5;
  zone2 = 0;
  mon1 = 1;
  mon2 = 1;
  day1 = 1;
  day2 = 1;
  hour1 = 17;
  hour2 = 2;
  min1 = 0;
  min2 = 0;
  
  calculator = new TimeCalculator(zone1, zone2, mon1, mon2, day1, day2, hour1, hour2, min1, min2);
  double hours = calculator.calculate();
  println(hours);
}

void draw() {
}