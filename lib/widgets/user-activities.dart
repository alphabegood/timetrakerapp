import 'dart:io';
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
  bool chartShowed = true;
  bool showingChartAction = false;

  _UserActivitiesState();

  DateTime selectedDate = DateTime.now();
  List<Activity> selectedActivities = [];

  _selectDate(DateTime date) {
    setState(() {
      selectedDate = date;
      print('Select Date $selectedDate');
    });
  }

  void _hideChart(val) {
    setState(() {
      chartShowed = val;
      showingChartAction = true;
    });
  }

  void _settingForLandscape(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    setState(() {
      if (!showingChartAction) {
        chartShowed = mediaQuery.orientation != Orientation.landscape;
      }
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
    _settingForLandscape(context);

    return Container(
      height: widget.appSize,
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch.adaptive(
                    value: chartShowed,
                    onChanged: (val) {
                      _hideChart(val);
                    }),
              ],
            ),
            chartShowed
                ? Container(
                    height:
                        constraints.maxHeight * 0.335, // Ideal for small screen
                    //height: constraints.maxHeight * 0.23,
                    child:
                        WeekChart(widget.activities, _selectDate, selectedDate),
                  )
                : SizedBox(
                    height: 0,
                  ),
            Container(
              padding: EdgeInsets.only(top: 10),
              height: constraints.maxHeight * 0.55,
              child: ActivityList(selectedActivities, selectedDate,
                  widget.removeActivityHandler),
            ),
          ],
        );
      }),
    );
  }
}
