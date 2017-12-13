class Timer {

  float Time;
  boolean timeUp;

  Timer(float set) {
    timeUp=false;
    Time= set;
  }

  float getTime() {
    return(Time);
  }

  void setTime(float set) {
    Time = set;
  }

  void countDown() {
    Time-=1/frameRate;

    if (Time<= 0) {
      timeUp= true;

      exit();
    }
  }
}