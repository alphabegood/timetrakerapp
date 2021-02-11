import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import './week-chart.dart';
import './activity-list.dart';
import '../models/activity.dart';

class UserActivities extends StatefulWidget {
  final double appSize;
  final List<Activity> activities;
  final Function removeActivityHandler;

  UserActivities(this.appSize, this.activities, this.removeActivityHandler);

  @override
  _UserActivitiesState createState() => _UserActivitiesState();
}

class _UserActivitiesState extends State<UserActivities> {
  _UserActivitiesState();

  DateTime selectedDate = DateTime.now();
  List<Activity> selectedActivities = [];

  _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
      print('Select Date $selectedDate');
    });
  }

  filterActivities() {
    setState(() {
      selectedActivities = widget.activities.reversed.where((activity) {
        return DateFormat('Mdy').format(activity.assignedDate) ==
            DateFormat('Mdy').format(selectedDate);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    //  print('AppSize ${widget.appSize} actvities ${widget.activities.length}');

    filterActivities();

    return Container(
      height: widget.appSize,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: constraints.maxHeight * 0.25,
              child: WeekChart(widget.activities, _selectDate, selectedDate),
            ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: constraints.maxHeight * 0.6,
              child: ActivityList(selectedActivities, selectedDate,
                  widget.removeActivityHandler),
            ),
          ],
        );
      }),
    );
  }
}
