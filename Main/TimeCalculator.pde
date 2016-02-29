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
    timeZones = new DateTimeZone[2];
    dateTimes = new DateTime[2];
    init();
  }

  void init() {
    timeZones[0] = DateTimeZone.forID(zone1);
    timeZones[1] = DateTimeZone.forID(zone2);
    dateTimes[0] = new DateTime(YEAR, start[MONTH], start[DAY], start[HOUR], start[MINUTE], timeZones[0]);
    dateTimes[1] = new DateTime(YEAR, end[MONTH], end[DAY], end[HOUR], end[MINUTE], timeZones[1]);
  }

  double calculate() {
    long time1 = dateTimes[0].getMillis();
    long time2 = dateTimes[1].getMillis();

    long timeDiff = time2 - time1;
    return timeDiff / HOUR_CONVERSION;
  }
}