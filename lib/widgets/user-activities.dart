import 'package:flutter/material.dart';

import './activity-list.dart';
import './activity-form.dart';
import '../models/activity.dart';

class UserActivities extends StatefulWidget {
  @override
  _UserActivitiesState createState() => _UserActivitiesState();
}

class _UserActivitiesState extends State<UserActivities> {
  bool _showActivityForm = false;

  final List<Activity> _activities = [
    // Activity(
    //   id: 1,
    //   title: 'Academind course',
    //   hours: '02',
    //   minutes: '10',
    //   details: 'Flutter course',
    //   creationDate: DateTime.now(),
    // ),
    // Activity(
    //   id: 2,
    //   title: 'Meeting with Collegues',
    //   hours: '01',
    //   minutes: '30',
    //   details: 'Roadmap design',
    //   creationDate: DateTime.now(),
    // ),
  ];

  void _addActivity(Activity activity) {
    //Assign a auto-increment id
    activity.id = _activities.length;
    print(activity.title);
    setState(() {
      _activities.add(activity);
      this._showActivityForm = false;
    });
  }

  void showActivityForm() {
    setState(() {
      this._showActivityForm = true;
    });
  }

  Widget displayFormButton() {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
              // backgroundColor: Colors.green,
              onPressed: showActivityForm,
              child: IconButton(
                // color: Colors.white,
                icon: Icon(Icons.add),
                onPressed: showActivityForm,
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        _showActivityForm
            ? ActivityForm(_addActivity, _activities.length)
            : displayFormButton(),
        SizedBox(
          height: 10,
        ),
        ActivityList(_activities.reversed.toList()),
      ],
    );
  }
}
