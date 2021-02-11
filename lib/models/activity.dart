class Activity {
  int id;
  String title;
  String hours;
  String minutes;
  String details;
  DateTime assignedDate;
  DateTime creationDate;

  Activity(
      {this.id,
      this.title,
      this.hours,
      this.minutes,
      this.details,
      this.assignedDate,
      this.creationDate});
}
