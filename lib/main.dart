import 'dart:io';
import 'package:flutter/material.dart';
import './models/activity.dart';
import './widgets/activity-form.dart';
import './widgets/user-activities.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final showActivityForm = false;
  List<Activity> activities = [];

  void _addActivity(Activity activity) {
    setState(() {
      activity.id = activities.length;
      activities.add(activity);
    });
  }

  void _removeActivity(Activity activity) {
    setState(() {
      activities.removeWhere((element) => element.id == activity.id);
    });
  }

  void _displayActivityForm(BuildContext context) {
    showModalBottomSheet(
        context: context,
        //isScrollControlled: true,
        builder: (_) {
          return GestureDetector(
            child: Container(
              height: 500, //Big screen
              child: ActivityForm(_addActivity),
            ),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var localAppBar = AppBar(
        title: Text(
          'Personal Time Tracker',
          style: TextStyle(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _displayActivityForm(context);
            },
          )
        ],
        backgroundColor: Colors.green[400]);

    var appSize = MediaQuery.of(context).size.height -
        MediaQuery.of(context).padding.top -
        localAppBar.preferredSize.height;

    return Container(
      child: Scaffold(
          appBar: localAppBar,
          body: SafeArea(
            child: Column(
              children: [UserActivities(appSize, activities, _removeActivity)],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: !Platform.isIOS
              ? FloatingActionButton(
                  child: Icon(Icons.add),
                  backgroundColor: Theme.of(context).primaryColor,
                  onPressed: () => _displayActivityForm(context),
                )
              : Container()),
    );
  }
}
