

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

        int [] dayHourMin = convertToDHM(nodes[i].totalTime);
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