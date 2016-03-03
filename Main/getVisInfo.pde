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
  int [] dateTime = convertToDateTime(nodes[rowNum].totalTime);

  String message;
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

String getCityPercentMessage(int rowNum) {
  double percent = nodes[rowNum].totalTime / totalTime * 100;

  String message;
  if (rowNum == 0) {
    message = "Todd spent " + (float)percent + " percent of 2015 at home.";
  } else {
    message = "Todd spent " + (float)percent + " percent of 2015 in " + nodes[rowNum].name + " .";
  }

  return message;
}

String getPercentStatMessage(int rowNum) {
  String message;
  message = percentIDs[rowNum] + (float)percentages[rowNum] + "%";

  return message;
}

String createTitle(int rowNum) {
  String name = nodes[rowNum].name;
  char [] chars = name.toCharArray();

  String title = " ";
  for (int i=0; i < chars.length; i++) {
    title += Character.toUpperCase(chars[i]) + " ";
  }

  return title;
}

color getColor(int index) {
  color c;
  if (durations[index] <= 6) {
    c = colors[0];
  } else if ((durations[index] > 6) && (durations[index] <= 24)) {
    c = colors[1];
  } else if ((durations[index] > 24) && (durations[index] <= 48)) {
    c = colors[2];
  } else if ((durations[index] > 48) && (durations[index] <= 96)) {
    c = colors[3];
  } else if ((durations[index] > 96) && (durations[index] <= 168)) {
    c = colors[4];
  } else {
    c = colors[5];
  }
  
  return c;
}