import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../models/activity.dart';
import './unit-time-field.dart';

class ActivityForm extends StatelessWidget {
  final Function addActivityHandler;
  final int activitiesNumber;

  final hourField = TextEditingController(text: '00');
  final minuteField = TextEditingController(text: '00');
  final titleField = TextEditingController();
  final detailsField = TextEditingController();

  ActivityForm(this.addActivityHandler, this.activitiesNumber);

  void _addActivity() {
    if (_isFormInvalid()) {
      return;
    }
    final activity = Activity(
        id: activitiesNumber,
        title: titleField.text,
        hours: hourField.text,
        minutes: minuteField.text,
        details: detailsField.text,
        creationDate: DateTime.now());

    print('new Activity' + activity.id.toString());

    addActivityHandler(activity);
  }

  bool _isFormInvalid() {
    return (titleField.text == '' ||
        (hourField.text == '00' && minuteField.text == '00'));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
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
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Details',
                ),
                controller: detailsField,
                onSubmitted: (_) => _addActivity()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.white,
                textColor: Colors.green,
                child: Text(
                  'Add Activity',
                ),
                onPressed: _addActivity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
