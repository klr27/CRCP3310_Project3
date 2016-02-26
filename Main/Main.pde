// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

import java.util.TimeZone;
import java.util.SimpleTimeZone;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.text.Format;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.text.ParsePosition;

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

void setup() {
  size(1200, 700);
  
  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");
  
  final int TOTAL_SCHED_COLS = schedule.getColumnCount();
  final int TOTAL_SCHED_ROWS = schedule.getRowCount();
  final int TOTAL_CI_COLS = cityInfo.getColumnCount();
  final int TOTAL_CI_ROWS = cityInfo.getRowCount();
  
}

void draw() {
}