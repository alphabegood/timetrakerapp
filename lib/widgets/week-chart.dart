import 'package:flutter/material.dart';

import '../models/grouped-activities.dart';
import './chart-bar.dart';

class WeekChart extends StatelessWidget {
  final List<GroupedActivities> weeeklyActivities;

  WeekChart(this.weeeklyActivities);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: weeeklyActivities
                .toList()
                .map((e) => ChartBar(e.day, e.totalTimes))
                .toList()),
      ),
    );
  }
}
