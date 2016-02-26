class TimeCalculator {

  final int MILL_CONVERSION = 60 * 60 * 1000;
  SimpleTimeZone [] timeZones = new SimpleTimeZone[2];
  //GregorianCalendar [] calendars = new GregorianCalendar[2];
  SimpleDateFormat format;

  TimeCalculator() {
    format = new SimpleDateFormat("MM/dd hh:mm a");
  }

  void setSimpleTimeZones(int [] zone) {
    for (int i=0; i<2; i++) {

      int rawOffset = zone[i] * MILL_CONVERSION;
      String [] ids = TimeZone.getAvailableIDs(rawOffset);
      String id = ids[0];

      timeZones[i] = new SimpleTimeZone(rawOffset, id);

      timeZones[i].setStartRule(Calendar.APRIL, 1, Calendar.SUNDAY, 2 * MILL_CONVERSION);
      timeZones[i].setEndRule(Calendar.OCTOBER, -1, Calendar.SUNDAY, 2 * MILL_CONVERSION);
      
     // calendars[i] = new GregorianCalendar(timeZones[i]);
    }
  }

  long getDuration(String start, String end) {
    try {
      ParsePosition p1 = new ParsePosition(0);
      ParsePosition p2 = new ParsePosition(0);
      Date d1 = format.parse(start, p1);
      Date d2 = format.parse(end, p2);
      
      long offset1 = timeZones[0].getOffset(d1.getTime());
      long offset2 = timeZones[1].getOffset(d2.getTime());
      
      return (long)(d2.getTime() + offset2) - (d1.getTime() + offset1);
    } 
    catch (NullPointerException e) {
      println("Error");
      e.printStackTrace();
    }
  }
}