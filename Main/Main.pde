// Project 3: Consuming Structured Data
// Visualization of my Dad's travel over 2015
// Kali Ruppert

Table schedule;
Table cityInfo;

void setup() {
  schedule = loadTable("RTRSchedule.csv", "header");
  cityInfo = loadTable("Lat-Long_TZ.csv", "header");
  
  final int TOTAL_SCHED_COLS = schedule.getColumnCount();
  final int TOTAL_SCHED_ROWS = schedule.getRowCount();
  final int TOTAL_CI_COLS = cityInfo.getColumnCount();
  final int TOTAL_CI_ROWS = cityInfo.getRowCount();
  
  for (int i=0; i<TOTAL_SCHED_COLS; i++) {
    println(schedule.getString(0, i));
  }

  for (int i=0; i<TOTAL_CI_COLS; i++) {
    println(cityInfo.getString(0, i));
  }
}

void draw() {
}