import 'package:flutter/material.dart';

import '../models/activity.dart';
import './activity-card.dart';
import './no-activity-graphic.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> userActivities;

  ActivityList(this.userActivities);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: userActivities.isEmpty
          ? NoActivityGraphic()
          : ListView.builder(
              itemCount: userActivities.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, index) {
                print('activity $index');
                return ActivityCard(userActivities[index]);
              }),
    );
  }
}
