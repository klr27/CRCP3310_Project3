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
    int [] dateTimeInfo = new int[2];
    dateTimeInfo[0] = start;
    dateTimeInfor[1] = end;
    for (int i=0; i<2; i++) {
      timeZones[i] = DateTimeZone.forID(zones[i]);
      dateTimes[i] = new DateTime(YEAR, start[MONTH], start[DAY], start[HOUR], start[MINUTE]);
    }
  }

  double calculate() {
    long timeDiff = dateTimes[1].getMillis() = dateTimes[0].getMillis();
    return timeDiff / HOUR_CONVERSION;
  }
}