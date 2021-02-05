import 'package:flutter/material.dart';

import './activity-list.dart';
import './activity-form.dart';
import '../models/activity.dart';

class UserActivities extends StatefulWidget {
  @override
  _UserActivitiesState createState() => _UserActivitiesState();
}

class _UserActivitiesState extends State<UserActivities> {
  final List<Activity> _activities = [
    Activity(
      id: 1,
      title: 'Academind course',
      hours: '2',
      minutes: '10',
      details: 'Flutter course',
      creationDate: DateTime.now(),
    ),
    Activity(
      id: 2,
      title: 'Meeting with Collegues',
      hours: '1',
      minutes: '30',
      details: 'Roadmap design',
      creationDate: DateTime.now(),
    ),
  ];

  void _addActivity(Activity activity) {
    //Assign a auto-increment id
    activity.id = _activities.length;
    print(activity.title);
    setState(() {
      _activities.add(activity);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivityForm(_addActivity, _activities.length),
        ActivityList(_activities),
      ],
    );
  }
}
