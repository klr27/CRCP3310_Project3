class Parser {
 
  Node [] nodes;

  Parser(Node [] nodes) {
    this.nodes = nodes;
  }

  int getNode(String name) {
    int index = 0;
    for (int i=0; i < nodes.length - 1; i++) {
      if (nodes[i].name == name) {
        index = i;
      }
    }
    return index;
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
  
}