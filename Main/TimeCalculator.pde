class TimeCalculator {

  final int MILL_CONVERSION = 60 * 60 * 1000;
  SimpleTimeZone [] timeZones = new SimpleTimeZone[2];
  GregorianCalendar [] calendars = new GregorianCalendar[2];
  int [] zoneOffsets = new int[2];
  SimpleDateFormat format;

  TimeCalculator() {
    format = new SimpleDateFormat("MM/dd/yyyy hh:mm a");
  }

  void setSimpleTimeZones(int zone1, int zone2) {
    int [] zones = new int[2];
    zones[0] = zone1;
    zones[1] = zone2;

    for (int i=0; i<2; i++) {
      zoneOffsets[i] = zones[i] * MILL_CONVERSION;
      String [] ids = TimeZone.getAvailableIDs(zoneOffsets[i]);
      String id = ids[0];

      timeZones[i] = new SimpleTimeZone(zoneOffsets[i], id);
      timeZones[i].setStartRule(Calendar.APRIL, 1, Calendar.SUNDAY, 2 * MILL_CONVERSION);
      timeZones[i].setEndRule(Calendar.OCTOBER, -1, Calendar.SUNDAY, 2 * MILL_CONVERSION);

      calendars[i] = new GregorianCalendar(timeZones[i]);
    }
  }

  void calculate(String start, String end, Node node) {
    try {
      ParsePosition p1 = new ParsePosition(0);
      ParsePosition p2 = new ParsePosition(0);
      Date d1 = format.parse(start, p1);
      Date d2 = format.parse(end, p2);
      
      calendars[0].setTime(d1);
      calendars[0].complete();
      calendars[1].setTime(d2);
      calendars[1].complete();

      long offset1 = calendars[0].get(ZONE_OFFSET) + calendars[0].get(DST_OFFSET);
      long offset2 = calendars[1].get(ZONE_OFFSET) + calendars[1].get(DST_OFFSET);

      println(offset1);
      println(offset2);
      println(d1.getTime());
      println(d2.getTime());

      node.totalTimeThere += (long)((d2.getTime() + offset2) - (d1.getTime() + offset1));
    } 
    catch (NullPointerException e) {
      println("Error");
      e.printStackTrace();
    }
  }
}