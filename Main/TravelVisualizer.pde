class TravelVisualizer {

  Node [] nodes;
  Path [] paths;
  Node transport;
  double [] durations;

  int [] indices = new int [2];
  int [] arrive1 = new int [4];
  int [] depart = new int[4];
  int [] arrive2 = new int[4];
  String zone1;
  String zone2;
  TimeCalculator city;
  TimeCalculator travel;
  PVector start;
  PVector end;

  int state;

  double totalTime;
  double percentHome;
  double percentLondon;
  double percentUS;
  double percentEurope;
  double percentAsia;
  double percentAustralia;
  double percentTravel;

  TravelVisualizer(Node [] nodes, Path [] paths, Node transport, int state) {
    this.nodes = nodes;
    this.paths = paths;
    this.transport = transport;
    this.state = state;
    durations = new double[totalSchedRows];
    initializeVis();
    calculatePercentages();
  }

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

  void initializeVis() {
    for (int i=0; i < totalSchedRows - 2; i++) {
      indices[0] = nodeMap.get(schedule.getString(i, "Location"));
      indices[1] = nodeMap.get(schedule.getString(i + 1, "Location"));

      nodes[indices[0]].timesVisited += 1;

      zone1 = nodes[indices[0]].timeZone;
      zone2 = nodes[indices[1]].timeZone;
      arrive1 = getDateTimeInfo(schedule.getString(i, "Arrival Date"), schedule.getString(i, "Arrival Time"));
      depart = getDateTimeInfo(schedule.getString(i, "Dep. Date"), schedule.getString(i, "Dep. Time"));
      arrive2 = getDateTimeInfo(schedule.getString(i+1, "Arrival Date"), schedule.getString(i+1, "Arrival Time"));

      city = new TimeCalculator(zone1, zone1, arrive1, depart);
      double cityTime = city.calculate();
      durations[i] = cityTime;
      nodes[indices[0]].totalTime += cityTime;

      travel = new TimeCalculator(zone1, zone2, depart, arrive2);
      double transportTime = travel.calculate();
      //travelTime[i] = transportTime;
      transport.totalTime =+ transportTime;

      start = new PVector(nodes[indices[0]].location.x, nodes[indices[0]].location.y);
      end = new PVector(nodes[indices[1]].location.x, nodes[indices[1]].location.y);
      paths[i] = new Path(start, end, pathState);
    }

    int index = nodeMap.get(schedule.getString(totalSchedRows - 1, "Location"));
    String lastTZ = nodes[index].timeZone;

    nodes[index].timesVisited += 1;

    int [] lastArr = new int[4];
    int [] lastDep = new int[4];
    lastArr = getDateTimeInfo(schedule.getString(totalSchedRows-1, "Arrival Date"), schedule.getString(totalSchedRows-1, "Arrival Time"));
    lastDep = getDateTimeInfo(schedule.getString(totalSchedRows-1, "Dep. Date"), schedule.getString(totalSchedRows-1, "Dep. Time"));

    TimeCalculator lastTime = new TimeCalculator(lastTZ, lastTZ, lastArr, lastDep);
    double cityDuration = lastTime.calculate();
    durations[totalSchedRows - 1] = cityDuration;
    nodes[index].totalTime += cityDuration;

    traveler = new Traveler(paths, durations, travelerState, step);
  }

  void calculateTotalTime() {
    for (int i=0; i < nodes.length - 1; i++) {
      totalTime += nodes[i].totalTime;
    }
    totalTime += transport.totalTime;
  }



 

  void displayCityStats() {
    for (int i=0; i < nodes.length -1; i++) {
      if ((mouseX >= nodes[i].location.x - 5) && (mouseX <= nodes[i].location.x + 5) && (mouseY >= nodes[i].location.x - 5) && (mouseY >= nodes[i].location.x +5)) {
        stroke(0);
        fill(150);
        rect(10, 400, 200, 100);
        fill(0);
        String timesVisited;
        if (i == 0) {
          timesVisited = "Todd was at home " + nodes[i].timesVisited + "times.";
        } else if (nodes[i].timesVisited == 1) {
          timesVisited = "Todd went to " + nodes[i].name + " once.";
        } else {
          timesVisited = "Todd went to " + nodes[i].name + " " + nodes[i].timesVisited + " times.";
        }

        int [] dayHourMin = convertToDayHourMin(nodes[i].totalTime);
        String day;
        String hour;
        String min;
        if (dayHourMin[0] == 0) {
          day = "Todd spent a total of ";
        }
        if (dayHourMin[2] == 0) {
          if (dayHourMin[0] == 1) {
            day = "Todd spent a total of 1 day, and";
          } else {
            day = "Todd spent a total of " + dayHourMin[0] + " days, and ";
          }
        } else {
          if (dayHourMin[0] == 1) {
            day = "Todd spent a total of 1 day, ";
          } else {
            day = "Todd spent a total of " + dayHourMin[0] + " days, ";
          }
        }
        if (dayHourMin[2] == 0) {
          if (dayHourMin[1] == 0) {
            hour = "";
          } else if (dayHourMin[1] == 1) {
            hour = "1 hour.";
          } else {
            hour = dayHourMin[1] + " hours.";
          }
        } else {
          if (dayHourMin[1] == 0) {
            hour = "and ";
          } else if (dayHourMin[1] == 1) {
            hour = "1 hour and ";
          } else {
            hour = dayHourMin[1] + " hours and";
          }
        }
        if (dayHourMin[2] == 0) {
          min = "";
        } else if (dayHourMin[2] == 1) {
          min = "1 minute.";
        } else {
          min = dayHourMin[2] + " minutes.";
        }
        String timeSpent = day + hour + min;

        text(nodes[i].name, 20, 440);
        text(timesVisited, 20, 460);
        text(timeSpent, 20, 480);
      }
    }
  }
  
  void displayToggleOptions() {
    stroke(0);
    fill(150);
    rect(10, 610, 700, 80);
    fill(0);
    text("'s' = Show/Hide Paths", 20, 630);
    text("'d' = Size city nodes equally or by duration", 20, 650);
    text("'c' = Display traveler node in black or in color", 20, 670);
    text("' ' = Active/Deactivate step by step traveler mode", 300, 630);
    text("Right Arrow = Move traveler forward on time journery", 300, 650);
    text("Left Arrow = Move traveler backwards on time journery", 300, 670);
    
  }

  void display() {
    for (int i=0; i < nodes.length-1; i++) {
      nodes[i].display(totalTime);
    }

    if (state == SHOW_ALL) {
      for (int i=0; i < paths.length - 1; i++) {
        paths[i].display();
      }
    } else { //<>//
      traveler.display();
    }
    
    displayCityStats();
    displayToggleOptions();
    
  }
}