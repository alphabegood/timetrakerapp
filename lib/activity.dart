class Activity {
  String title;
  String hours;
  String minutes;
  String details;
  int duration;
  DateTime creationDate;

  Activity({this.title, this.duration, this.creationDate});

  Activity setActivity(hours, minutes, title, details) {
    this.title = title;
    this.details = details;
    this.hours = hours;
    this.minutes = minutes;
    return this;
  }
}
