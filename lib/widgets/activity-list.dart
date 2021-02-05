import 'package:flutter/material.dart';

import '../models/activity.dart';
import './activity-card.dart';

class ActivityList extends StatelessWidget {
  final List<Activity> userActivities;

  ActivityList(this.userActivities);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: userActivities.length,
          itemBuilder: (ctx, index) {
            print('activity $index');
            return ActivityCard(userActivities[index]);
          }),
    );
  }
}
