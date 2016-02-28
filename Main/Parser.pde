class Parser {
  
  String arrDate;
  String arrTime;
  String depDate;
  String depTime;
  int mon1;
  int mon2;
  int d1;
  int d2;
  int h1;
  int h2;
  int min1;
  int min2;
  
  Parser(String arrDate, String arrTime, String depDate, String depTime) {
    this.arrDate = arrDate;
    this.arrTime = arrTime;
    this.depDate = depDate;
    this.depTime = depTime;
  }
  
  int getDay(String date) {
    String [] list = split(date, '/');
    return 
  }
}