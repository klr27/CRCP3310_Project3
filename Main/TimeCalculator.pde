class TimeCalculator {

  String zone1;
  String zone2;
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

  TimeCalculator(String zone1, String zone2, int [] start, int [] end) {
    this.zone1 = zone1;
    this.zone2 = zone2;
    this.start = start;
    this.end = end;
    init();
  }

  void init() {
    timeZones[0] = DateTimeZone.forID(zone1);
    timeZones[1] = DateTimeZone.forID(zone2);
    dateTimes[0] = new DateTime(YEAR, start[MONTH], start[DAY], start[HOUR], start[MINUTE], timeZones[0]);
    dateTimes[1] = new DateTime(YEAR, end[MONTH], end[DAY], end[HOUR], end[MINUTE], timeZones[1]);
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