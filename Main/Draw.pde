String getTimesVisitedMessage(int rowNum) {
  String message;
  if (rowNum == 0) {
    message = "Todd was at home " + nodes[rowNum].timesVisited + "times.";
  } else if (nodes[rowNum].timesVisited == 1) {
    message = "Todd went to " + nodes[rowNum].name + " once.";
  } else {
    message = "Todd went to " + nodes[rowNum].name + " " + nodes[rowNum].timesVisited + " times.";
  }

  return message;
}

String getDateTimeMessage(int rowNum) {
  String message;
  int [] dateTime = convertToDateTime(nodes[rowNum].totalTime);
  if (rowNum == 0) {
    message = "Todd was at home for a total of" + dateTime[0] + "days, " + dateTime[1] + "hours and " + dateTime[2] + " minutes.";
    
  } else if ((dateTime[0] == 0) && (dateTime[1] == 0)) {
    message = "Todd spent a total of " + dateTime[2] + "minutes in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 0) && (dateTime[1] == 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of 1 hour and 1 minute in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 0) && (dateTime[1] == 1) && (dateTime[2] == 0)) {
    message = "Todd spent a total of 1 hour in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 0) && (dateTime[1] == 1) && (dateTime[2] > 1)) {
    message = "Todd spent a total of 1 hour and " + dateTime[2] + " minutes in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 0) && (dateTime[1] > 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of "  + dateTime[1] + " hours and 1 minute in " + nodes[rowNum].name + " .";
    
  } else if ((dateTime[0] == 1) && (dateTime[1] == 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of 1 day, 1 hour and 1 minute in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 1) && (dateTime[1] == 1) && (dateTime[2] > 1)) {
    message = "Todd spent a total of 1 day, 1 hour and " + dateTime[2] + " minutes in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 1) && (dateTime[1] == 1) && (dateTime[2] == 0)) {
    message = "Todd spent a total of 1 day and 1 hour in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 1) && (dateTime[1] > 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of 1 day, " + dateTime[1] + " hours and 1 minute in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 1) && (dateTime[1] == 0) && (dateTime[2] == 1)) {
    message = "Todd spent a total of 1 day, and " + dateTime[2] + " minutes in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] == 1) && (dateTime[1] == 0) && (dateTime[2] == 1)) {
    message = "Todd spent a total of 1 day and 1 minute in " + nodes[rowNum].name + " .";
    
  } else if ((dateTime[0] > 1) && (dateTime[1] == 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of " + dateTime[0] + "days, 1 hour and 1 minute in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] > 1) && (dateTime[1] == 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of " + dateTime[0] + " days, 1 hour and " + dateTime[2] + " minutes in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] > 1) && (dateTime[1] == 1) && (dateTime[2] == 0)) {
    message = "Todd spent a total of " + dateTime[0] + " days and 1 hour in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] > 1) && (dateTime[1] == 0) && (dateTime[2] == 1)) {
    message = "Todd spent a total of " + dateTime[0] + " days and 1 minute in " + nodes[rowNum].name + " .";
  } else if ((dateTime[0] > 1) && (dateTime[1] > 1) && (dateTime[2] == 1)) {
    message = "Todd spent a total of " + dateTime[0] + " days, " + dateTime[1] + " hours and 1 minute in " + nodes[rowNum].name + " .";
  } else {
    message = "Todd spent a total of " + dateTime[0] + " days, " + dateTime[1] + " hours and " + dateTime[2] + " minutes in " + nodes[rowNum].name + " .";
  }

  return message;
}

void displayCityStats() {
  for (int i=0; i < nodes.length -1; i++) {
    if ((mouseX >= nodes[i].location.x - 5) && (mouseX <= nodes[i].location.x + 5) && (mouseY >= nodes[i].location.x - 5) && (mouseY >= nodes[i].location.x +5)) {
      stroke(0);
      fill(150);
      rect(10, 400, 200, 100);
      fill(0);
      String timesVisited;


      int [] dayHourMin = convertToDateTime(nodes[i].totalTime);
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

void displayPercentages() {
}