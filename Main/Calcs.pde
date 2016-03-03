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

  println(z1);
  println(arrive);
  println(depart);

  TimeCalculator calc = new TimeCalculator(z1, z1, arrive, depart);
  return calc;
}

TimeCalculator getTravelCalculator(int rowNum) {
  String z1 = nodes[getIndex(rowNum)].timeZone;
  String z2 = nodes[getIndex(rowNum + 1)].timeZone;
  int [] depart = getDateTimeInfo(schedule.getString(rowNum, "Dep. Date"), schedule.getString(rowNum, "Dep. Time"));
  int [] arrive = getDateTimeInfo(schedule.getString(rowNum + 1, "Arrival Date"), schedule.getString(rowNum + 1, "Arrival Time"));

  println(z1);
  println(z2);
  println(depart);
  println(arrive);

  TimeCalculator calc = new TimeCalculator(z1, z2, depart, arrive);
  return calc;
}

void calculateTimes() {
  for (int i=0; i < totalSchedRows - 2; i++) {
    int index = getIndex(i);
    println(index);
    println(nodes[index].name);
    nodes[index].timesVisited += 1;

    TimeCalculator city = getCityCalculator(i);
    double cityTime = city.calculate();
    println(cityTime);
    nodes[index].totalTime += cityTime;

    durations[i] = cityTime;

    TimeCalculator travel = getTravelCalculator(i);
    double transportTime = travel.calculate();
    println(transportTime);
    transport.totalTime += transportTime;
  }
  TimeCalculator lastCity = getCityCalculator(totalSchedRows - 1);
  double lastTime = lastCity.calculate();
  println(lastTime);
  nodes[getIndex(totalSchedRows - 1)].totalTime += lastTime;
  durations[totalSchedRows - 1] = lastTime;
}

int [] convertToDateTime(double time) {
  int [] dateTimes = new int[3];
  dateTimes[0] = (int)(time / 1000 * 60 * 60 * 24);
  dateTimes[1] = (int)(time / (1000 * 60 * 60) % 24);
  dateTimes[2] = (int)(time / (1000 * 60) % 60);

  return dateTimes;
}

void calculateTotalTime() {
  for (int i=0; i < nodes.length - 1; i++) {
    totalTime += nodes[i].totalTime;
  }
  totalTime += transport.totalTime;
  
  println(totalTime);
}

void calculateTimeForPercent() {
  for (int i=0; i < nodes.length - 1; i++) {
    String area = percentageMap.get(nodes[i].name);
    if (area == "US") {
      percentages[US] += nodes[i].totalTime;
    } else if (area == "Europe") {
      percentages[EUROPE] += nodes[i].totalTime;
    } else if (area == "Asia") {
      percentages[ASIA] += nodes[i].totalTime;
    } else {
      percentages[AUSTRALIA] += nodes[i].totalTime;
    }
  }
}

void calculatePercentages() {
  calculateTotalTime();
  calculateTimeForPercent();

  for (int i=2; i<6; i++) {
    percentages[i] = percentages[i] / totalTime * 100;
  }
  percentages[0] = nodes[nodeMap.get("Baltimore")].totalTime / totalTime * 100;
  percentages[1] = nodes[nodeMap.get("London")].totalTime / totalTime * 100;
  percentages[6] = transport.totalTime/totalTime * 100;
}