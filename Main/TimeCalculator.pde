class TimeCalculator {

  String zone1;
  String zone2;
  DateTimeZone tz1;
  DateTimeZone tz2;
  DateTime date1;
  DateTime date2;
  final double HOUR_CONVERSION = 60 * 60 * 1000;

  final int YEAR = 2015;
  int mon1;
  int mon2;
  int d1;
  int d2;
  int h1;
  int h2;
  int min1;
  int min2;

  TimeCalculator(String zone1, String zone2, int mon1, int mon2, int d1, int d2, int h1, int h2, int min1, int min2) {
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
    init();
  }

  void init() {
    tz1 = DateTimeZone.forID(zone1);
    tz2 = DateTimeZone.forID(zone2);

    date1 = new DateTime(YEAR, mon1, d1, h1, min1, tz1);
    date2 = new DateTime(YEAR, mon2, d2, h2, min2, tz2);
  }

  double calculate() {
    long time1 = date1.getMillis();
    println(time1);
    long time2 = date2.getMillis();
    println(time2);
    long timeDiff = time2 - time1;
    println(timeDiff);
    
    return timeDiff / HOUR_CONVERSION;
  }
}