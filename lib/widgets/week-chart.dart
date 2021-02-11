import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/grouped-activities.dart';
import '../models/activity.dart';
import './chart-bar.dart';

class WeekChart extends StatefulWidget {
  final List<Activity> activities;
  final Function selectDateHandler;
  final DateTime currentDate;

  WeekChart(this.activities, this.selectDateHandler, this.currentDate);

  @override
  _WeekChartState createState() => _WeekChartState();
}

class _WeekChartState extends State<WeekChart> {
  double weekMinutes = 0;

  List<GroupedActivities> groupedActivities = [
    GroupedActivities(DateTime.now().subtract(Duration(days: 6)), '00h00'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 5)), '00h00'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 4)), '00h00'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 3)), '00h00'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 2)), '00h00'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 1)), '00h00'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 0)), '00h00'),
  ].toList();

  resetTimes() {
    weekMinutes = 0;
    groupedActivities = [
      GroupedActivities(DateTime.now().subtract(Duration(days: 6)), '00h00'),
      GroupedActivities(DateTime.now().subtract(Duration(days: 5)), '00h00'),
      GroupedActivities(DateTime.now().subtract(Duration(days: 4)), '00h00'),
      GroupedActivities(DateTime.now().subtract(Duration(days: 3)), '00h00'),
      GroupedActivities(DateTime.now().subtract(Duration(days: 2)), '00h00'),
      GroupedActivities(DateTime.now().subtract(Duration(days: 1)), '00h00'),
      GroupedActivities(DateTime.now().subtract(Duration(days: 0)), '00h00'),
    ].toList();
  }

  _addUpTimes() {
    setState(() {
      resetTimes();

      groupedActivities = groupedActivities.map((g) {
        double dayMinutes = 0;

        widget.activities.forEach((a) {
          if (DateFormat('MEd').format(g.day) ==
              DateFormat('MEd').format(a.assignedDate)) {
            dayMinutes +=
                double.parse(a.minutes) + (double.parse(a.hours) * 60);
          }
        });

        String hoursStr = (dayMinutes ~/ 60).toString().padLeft(2, '0');
        String minutesStr =
            (dayMinutes % 60).toInt().toString().padLeft(2, '0');

        weekMinutes += dayMinutes;

        //print('${g.day} ${g.totalTimes} $weekMinutes');
        return GroupedActivities(g.day, '${hoursStr}h$minutesStr');
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    //_getWeekOverallTimes();
    _addUpTimes();

    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: groupedActivities
                  .toList()
                  .map(
                    (e) => ChartBar(e.day, e.totalTimes, weekMinutes,
                        widget.selectDateHandler, widget.currentDate),
                  )
                  .toList(),
            ),
            Padding(
                padding: EdgeInsets.all(3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        DateFormat('MMM y').format(groupedActivities.first.day),
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
