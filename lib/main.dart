import 'package:flutter/material.dart';

import 'activity-card.dart';
import 'activity-form.dart';
import 'activity.dart';

void main() => runApp(TimeTrackerApp());

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Time Tracker App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  final List<Activity> activities = [
    Activity(
      // id: 1,
      title: 'Academind course',
      duration: 65,
      creationDate: DateTime.now(),
    ),
    Activity(
      //id: 2,
      title: 'Meeting with Collegues',
      duration: 133,
      creationDate: DateTime.now(),
    ),
  ];

  void _addActivity(Activity activity) {
    print(activity.title);
    //activities.add(activity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text('Time Tracker App'),
            backgroundColor: Colors.green[400]),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Card'),
                elevation: 6,
              ),
            ),
            ActivityForm(_addActivity),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: activities.map(
                (activity) {
                  return ActivityCard(activity);
                },
              ).toList(),
            )
          ],
        ),
      ),
    );
  }
}
