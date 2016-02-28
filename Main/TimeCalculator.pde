class TimeCalculator {

  String [] zones;
  DateTimeZone [] timeZones;
  DateTime [] dateTimes;
  final double HOUR_CONVERSION = 60 * 60 * 1000;

  final int YEAR = 2015;
  int [] start;
  int [] end;

  final int MONTH = 0;
  final int DAY = 1;
  final int HOUR = 2;
  final int MINUTE = 3;

  TimeCalculator(String [] zones, int [] start, int [] end) {
    this.zones = zones;
    this.start = start;
    this.end = end;
    init();
  }

  void init() {
    for (int i=0; i<2; i++) {
      timeZones[i] = DateTimeZone.forID(zones[i]);
    }
    dateTimes[0] = new DateTime(YEAR, start[MONTH], start[DAY], start[HOUR], start[MINUTE]);
    dateTimes[1] = new DateTime(YEAR, end[MONTH], end[DAY], end[HOUR], end[MINUTE]);
  }

  double calculate() {
    long [] times = new long[2];
    for (int i=0; i<2; i++) {
      times[i] = dateTimes[i].getMillis();
    }

    long timeDiff = times[1] - times[2];
    return timeDiff / HOUR_CONVERSION;
  }
}