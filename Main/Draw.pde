void displayTitle() {
  stroke(0);
  fill(255, 150);
  rectMode(CENTER);
  rect(600, 30, 700, 40);

  textFont(title);
  textAlign(CENTER);
  String title = "V I S U A L I Z I N G   T O D D   R U P P E R T ' S   2 0 1 5   T R A V E L";
  fill(0);
  text(title, 600, 45);
}

void displayCityStats() {
  for (int i=0; i < nodes.length -1; i++) {
    if ((mouseX >= nodes[i].location.x - 5) && (mouseX <= nodes[i].location.x + 5) && (mouseY >= nodes[i].location.x - 5) && (mouseY >= nodes[i].location.x +5)) {
      stroke(0);
      fill(255, 150);
      rectMode(CENTER);
      rect(600, 300, 600, 200);

      textAlign(CENTER);
      fill(0);

      textFont(cityStatHeader);
      text(createTitle(i), 600, 240);

      textFont(cityStatText);
      text(getTimesVisitedMessage(i), 600, 300);
      text(getDateTimeMessage(i), 600, 340);
      text(getCityPercentMessage(i), 600, 380);
    }
  }
}

void displayPercentages() {
  if (percentState == SHOW) {
    stroke(0); 
    fill(255, 150);
    rectMode(CORNER);
    rect(10, 300, 200, 150);

    textAlign(RIGHT);
    fill(0);
    textFont(text);
    text(getPercentStatMessage(0), 20, 320);
    text(getPercentStatMessage(1), 20, 340);
    text(getPercentStatMessage(2), 20, 360);
    text(getPercentStatMessage(3), 20, 380);
    text(getPercentStatMessage(4), 20, 400);
    text(getPercentStatMessage(5), 20, 420);
    text(getPercentStatMessage(6), 20, 440);
  }
}

void displayToggleOptions() {
  stroke(0);
  fill(225);
  rectMode(CORNER);
  rect(0, 575, 1200, 125);
  fill(175);
  rect(10, 585, 840, 105);
  fill(0);
  textAlign(RIGHT);
  textFont(header);
  text("Controls:", 20, 610);
  text("Hover mouse over city for stats", 20, 640);
  text("D = Activate/Deactivate cities by duration", 20, 660);
  text("P = Show/Hide percentages", 20, 680);
  text("S = Show/Hide traveler ", 400, 640);
  text("C = Activate/Deactivate traveler by color", 400, 660);
  text("Right/Left Arrows = Move forward/backward", 400, 680);
}

void displayColorMeanings() {
  stroke(0);
  fill(175);

  rectMode(CORNER);
  rect(970, 585, 220, 105);

  textAlign(RIGHT);
  textFont(header);
  fill(0);
  text("Trip Durations by Color:", 980, 610);
  stroke(colors[0]);
  fill(colors[0]);
  text("0 - 6 hours", 980, 640);
  fill(colors[1]);
  stroke(colors[1]);
  text("6 - 24 hours", 980, 660);
  fill(colors[2]);
  stroke(colors[2]);
  text("1 - 2 days", 980, 680);
  fill(colors[3]);
  stroke(colors[3]);
  text("2 - 4 days", 1090, 640);
  fill(colors[4]);
  stroke(colors[4]);
  text("4 - 7 days", 1090, 660);
  fill(colors[5]);
  stroke(colors[5]);
  text("More than a week", 1090, 680);
}

void displayTraveler() {
  if (travelerState == BLACK) {
    stroke(0);
    fill(0);
  } else {
    stroke(getColor(step));
    fill(getColor(step));
  }

  ellipseMode(CENTER);
  if (step != totalSchedRows - 1) {
    ellipse(paths[step].start.x, paths[step].start.y, 10, 10);
  } else {
    ellipse(paths[paths.length - 1].end.x, paths[paths.length - 1].end.y, 10, 10);
  }

  if (step != 0) {
    for (int i=0; i < step; i++) {
      paths[i].display();
    }
  }
}

void drawVis() {
  image(map, 0, 0);  
  drawTitle();

  for (int i=0; i < nodes.length - 1; i++) {
    nodes[i].display(totalTime);
  }

  displayCityStats();
  displayToggleOptions();
  
  if (percentState == SHOW) {
    displayPercentages();
  }
  if (stepState == SHOW) {
    displayTraveler();
    displayColorMeanings();
  }
}