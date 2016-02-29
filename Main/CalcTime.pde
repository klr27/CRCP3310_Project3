int [] getDateTimeInfo(String date, String time) {
  String [] dateList = split(date, '/');
  String [] timeList = split(time, ':');
  int [] dateTime = new int[4];
  dateTime[0] = int(dateList[0]);
  dateTime[1] = int(dateList[1]);
  dateTime[2] = int(timeList[0]);
  dateTime[3] = int(timeList[1]);

  return dateTime;
}

TimeCalculator getCityCalculator(int rowNum) {
  String z1 = nodes[getIndex(rowNum)].timeZone;
  int [] arrive = getDateTimeInfo(schedule.getString(rowNum, "Arrival Date"), schedule.getString(rowNum, "Arrival Time"));
  int [] depart = getDateTimeInfo(schedule.getString(rowNum, "Dep. Date"), schedule.getString(rowNum, "Dep. Time"));

  TimeCalculator calc = new TimeCalculator(z1, z1, arrive, depart);
  return calc;
}

TimeCalculator getTravelCalculator(int rowNum) {
  String z1 = nodes[getIndex(rowNum)].timeZone;
  String z2 = nodes[getIndex(rowNum + 1)].timeZone;
  int [] depart = getDateTimeInfo(schedule.getString(rowNum, "Dep. Date"), schedule.getString(rowNum, "Dep. Time"));
  int [] arrive = getDateTimeInfo(schedule.getString(rowNum + 1, "Arrival Date"), schedule.getString(rowNum + 1, "Arrival Time"));

  TimeCalculator calc = new TimeCalculator(z1, z2, depart, arrive);
  return calc;
}

void calculateTimes() {
  for (int i=0; i < totalSchedRows - 2; i++) {
    nodes[getIndex(i)].timesVisited += 1;

    TimeCalculator city = getCityCalculator(i);
    double cityTime = city.calculate();
    nodes[getIndex(i)].totalTime += cityTime;

    durations[i] = cityTime;

    TimeCalculator  travel = getTravelCalculator(i);
    double transportTime = travel.calculate();
    transport.totalTime =+ transportTime;
  }
  TimeCalculator lastCity = getCityCalculator(totalSchedRows - 1);
  double lastTime = lastCity.calculate();
  durations[totalSchedRows - 1] = lastTime;
}

 int [] convertToDateTime(double time) {
    int [] dateTimes = new int[3];
    dateTimes[0] = (int)(time / 1000 * 60 * 60 * 24);
    dateTimes[1] = (int)(time / (1000 * 60 * 60) % 24);
    dateTimes[2] = (int)(time / (1000 * 60) % 60);

    return dateTimes;
  }