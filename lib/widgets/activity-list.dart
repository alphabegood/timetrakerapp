import 'package:flutter/material.dart';

import '../models/activity.dart';
import './activity-card.dart';
import './no-activity-graphic.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> userActivities;
  final DateTime selectedDate;
  final Function removeHandler;

  ActivityList(this.userActivities, this.selectedDate, this.removeHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: userActivities.isEmpty
          ? NoActivityGraphic(selectedDate)
          : ListView.builder(
              itemCount: userActivities.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                // print('activity $index');
                return ActivityCard(userActivities[index], () {
                  removeHandler(userActivities[index]);
                });
              }),
    );
  }
}
