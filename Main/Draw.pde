void displayCityStats() {
  for (int i=0; i < nodes.length -1; i++) {
    if ((mouseX >= nodes[i].location.x - 5) && (mouseX <= nodes[i].location.x + 5) && (mouseY >= nodes[i].location.x - 5) && (mouseY >= nodes[i].location.x +5)) {
      stroke(0);
      fill(255, 150);
      rectMode(CENTER);
      rect(600, 300, 600, 200);

      PFont title = createFont("MyriadPro-Bold", 22);
      PFont text = createFont("MyriadPro-Semibold", 14);
      textAlign(CENTER);
      fill(0);

      textFont(title);
      text(createTitle(i), 600, 240);

      textFont(text);
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
  } else {
    traveler.display();
  }

  displayCityStats();
  displayToggleOptions();
}