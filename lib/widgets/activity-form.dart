import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import '../models/activity.dart';
import './unit-time-field.dart';

class ActivityForm extends StatefulWidget {
  //final Function addActivityHandler;
  //final int activitiesNumber;

  final Function addActivityHandler;

  //ActivityForm(this.addActivityHandler, this.activitiesNumber);
  ActivityForm(this.addActivityHandler);

  @override
  _ActivityFormState createState() => _ActivityFormState();
}

class _ActivityFormState extends State<ActivityForm> {
  final hourField = TextEditingController(text: '01');

  final minuteField = TextEditingController(text: '30');

  final titleField = TextEditingController(text: 'Tensorflow Tuto');

  DateTime dateAssigned = DateTime.now();

  final detailsField = TextEditingController();

  void _addActivity() {
    if (_isFormInvalid()) {
      return;
    }
    final activity = Activity(
        id: 0,
        title: titleField.text,
        hours: hourField.text,
        minutes: minuteField.text,
        details: detailsField.text,
        assignedDate: dateAssigned,
        creationDate: DateTime.now());

    setState(() {
      widget.addActivityHandler(activity);
    });

    Navigator.of(context).pop();
  }

  void _popDatePicker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    ).then((value) => {
          setState(() {
            dateAssigned = value;
          })
        });
  }

  bool _isFormInvalid() {
    return (titleField.text == '' ||
        (hourField.text == '00' && minuteField.text == '00'));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                UnitTimeField('Hours', hourField, _addActivity),
                UnitTimeField('Minutes', minuteField, _addActivity),
                Container(
                  child: Expanded(
                    flex: 1,
                    child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Title',
                        ),
                        controller: titleField,
                        onSubmitted: (_) => _addActivity()),
                  ),
                ),
              ],
            ),
            TextField(
              maxLines: 2,
              decoration: InputDecoration(
                labelText: 'Details',
              ),
              controller: detailsField,
              onSubmitted: (_) => _addActivity(),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                  onPressed: () {
                    _popDatePicker(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.date_range),
                      Text(DateFormat('EEE, d MMM y')
                          .format(dateAssigned)
                          .toString())
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Icon(Icons.add_sharp),
                onPressed: _addActivity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
