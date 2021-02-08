import 'package:flutter/material.dart';
import './widgets/user-activities.dart';
import './widgets/week-chart.dart';
import './models/grouped-activities.dart';

void main() => runApp(TimeTrackerApp());

class TimeTrackerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Time Tracker',
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Raleway',
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // var showForm = false;

  // void showActivityForm() {
  //   showForm = true;
  // }

  List<GroupedActivities> groupedActivities = [
    GroupedActivities(DateTime.now().subtract(Duration(days: 6)), '02h30'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 5)), '02h30'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 4)), '02h30'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 3)), '02h30'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 2)), '02h30'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 1)), '02h30'),
    GroupedActivities(DateTime.now().subtract(Duration(days: 0)), '02h30'),
  ].toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              'Personal Time Tracker',
              style: TextStyle(),
            ),

            // actions: [
            //   IconButton(
            //     icon: Icon(Icons.add),
            //     onPressed: () {},
            //   )
            // ],
            backgroundColor: Colors.green[400]),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              child: WeekChart(groupedActivities),
            ),
            UserActivities()
          ],
        ),
        // floatingActionButton: FloatingActionButton(
        //   child: Icon(Icons.add),
        //   backgroundColor: Colors.green[400],
        //   onPressed: ()  {},
        // ),
      ),
    );
  }
}
