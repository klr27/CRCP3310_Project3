class TimeCalculator {

  int zone1;
  int zone2;
  //final int MILL_CONVERSION = 60 * 60 * 1000;
  
  final double HOUR_CONVERSION = 60 * 60 * 1000;

  /*SimpleTimeZone tz1;
   SimpleTimeZone tz2;
   GregorianCalendar calendar1;
   GregorianCalendar calendar2;
   */
   
  final int YEAR = 2015;
  int mon1;
  int mon2;
  int d1;
  int d2;
  int h1;
  int h2;
  int min1;
  int min2;

  TimeCalculator(int zone1, int zone2, int mon1, int mon2, int d1, int d2, int h1, int h2, int min1, int min2) {
    this.zone1 = zone1;
    this.zone2 = zone2;
    this.mon1 = mon1;
    this.mon2 = mon2;
    this.d1 = d1;
    this.d2 = d2;
    this.h1 = h1;
    this.h2 = h2;
    this.min1 = min1;
    this.min2 = min2;
  }

  void setDateTimeZones() {
    int zOffset1 = zone1 * MILL_CONVERSION;
    String [] ids1 = TimeZone.getAvailableIDs(zOffset1);
    String id1 = ids1[0];

    int zOffset2 = zone2 * MILL_CONVERSION;
    String [] ids2 = TimeZone.getAvailableIDs(zOffset2);
    String id2 = ids1[0];

    tz1 = new SimpleTimeZone(zOffset1, id1);
    tz1.setStartRule(Calendar.APRIL, 1, Calendar.SUNDAY, 2 * MILL_CONVERSION);
    tz1.setEndRule(Calendar.OCTOBER, -1, Calendar.SUNDAY, 2 * MILL_CONVERSION);

    tz2 = new SimpleTimeZone(zOffset2, id2);
    tz2.setStartRule(Calendar.APRIL, 1, Calendar.SUNDAY, 2 * MILL_CONVERSION);
    tz2.setEndRule(Calendar.OCTOBER, -1, Calendar.SUNDAY, 2 * MILL_CONVERSION);
  }

  void setCalendars() {
    calendar1 = new GregorianCalendar(YEAR, mon1, d1, h1, min1);
    calendar1.setTimeZone(tz1);

    calendar2 = new GregorianCalendar(YEAR, mon2, d2, h2, min2);
    calendar1.setTimeZone(tz2);
  }

  double calculate() {
    setSimpleTimeZones();
    setCalendars();

    Date time1 = calendar1.getTime();
    Date time2 = calendar2.getTime();
    long timeDiff = time2.getTime() - time1.getTime();

    return timeDiff / HOUR_CONVERSION;
  }
}