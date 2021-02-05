import 'package:flutter/material.dart';
import './widgets/user-activities.dart';

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
            UserActivities()
          ],
        ),
      ),
    );
  }
}
