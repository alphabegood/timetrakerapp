import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;

  ActivityCard(this.activity);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            width: 85,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColorLight,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(3.5),
                )),
            child: Text(
              '${activity.hours}h:${activity.minutes}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                activity.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                DateFormat('EEEE, d MMMM HH:mm').format(activity.creationDate),
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
