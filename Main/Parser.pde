class Parser {
 
  Node [] nodes;

  Parser(Node [] nodes) {
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
  
  int [] getDate/Time(String date, String time) {
    String [] dateList = split(date, '/');
    String [] timeList = split(time, ':');
    int [] dateTime = new int[4];
    dateTime[0] = dateList[0];
    dateTime[1] = dateList[1];
    dateTime[2] = timeList[0];
    dateTime[3] = timeList[1];
    
    return dateTime;
  }
  
}