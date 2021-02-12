import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/activity.dart';

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final Function removeActivityHandler;

  ActivityCard(this.activity, this.removeActivityHandler);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Container(
        width: double.infinity,
        child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Text(
                  '${activity.hours}h:${activity.minutes}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      activity.title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),
                  FittedBox(
                    fit: BoxFit.fitWidth,
                    child: Text(
                      DateFormat('EEEE, d MMMM HH:mm')
                          .format(activity.assignedDate),
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                //crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: removeActivityHandler,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
