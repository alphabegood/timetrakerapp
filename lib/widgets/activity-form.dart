import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import '../models/activity.dart';
import './time-form-field.dart';

class ActivityForm extends StatelessWidget {
  final Function addActivityHandler;
  final int activitiesNumber;

  final hourField = TextEditingController(text: '00');
  final minuteField = TextEditingController(text: '00');
  final titleField = TextEditingController();
  final detailsField = TextEditingController();

  ActivityForm(this.addActivityHandler, this.activitiesNumber);

  void addActivity() {
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

  // void _setHours(value) {
  //   print(value);
  //   if (value.length == 3) {
  //     hourField.text = value.toString().substring(1);
  //     hourField.selection = TextSelection(
  //         baseOffset: hourField.text.length,
  //         extentOffset: hourField.text.length);
  //     print('New Hour ${hourField.text}');
  //   }
  // }

  // void _initHoursPointer() {
  //   hourField.selection = TextSelection(
  //     baseOffset: hourField.text.length,
  //     extentOffset: hourField.text.length,
  //   );
  // }

  // void _setMinutes(value) {
  //   print(value);
  //   if (value.length == 3) {
  //     minuteField.text = value.toString().substring(1);
  //     minuteField.selection = TextSelection(
  //         baseOffset: hourField.text.length,
  //         extentOffset: hourField.text.length);
  //     print('New Hour ${hourField.text}');
  //   }
  // }

  // void _initMinutesPointer() {
  //   minuteField.selection = TextSelection(
  //     baseOffset: hourField.text.length,
  //     extentOffset: hourField.text.length,
  //   );
  // }

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
                TimeFormField('Hours', hourField),
                TimeFormField('Minutes', minuteField),
                // Container(
                //   margin: EdgeInsets.only(right: 5),
                //   child: SizedBox(
                //     width: 70,
                //     child: TextField(
                //       style: TextStyle(
                //         fontSize: 18,
                //         fontWeight: FontWeight.bold,
                //       ),
                //       keyboardType: TextInputType.number,
                //       onChanged: _setHours,
                //       onTap: _initHoursPointer,
                //       decoration: InputDecoration(
                //         labelText: 'Hours',
                //         hintStyle: TextStyle(
                //           inherit: false,
                //           fontWeight: FontWeight.normal,
                //         ),
                //         counterText: '',
                //       ),
                //       controller: hourField,
                //     ),
                //   ),
                // ),
                // Container(
                //   margin: EdgeInsets.only(right: 5),
                //   child: SizedBox(
                //     width: 70,
                //     child: TextField(
                //       style:
                //           TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                //       keyboardType: TextInputType.number,
                //       onChanged: _setMinutes,
                //       onTap: _initMinutesPointer,
                //       decoration: InputDecoration(
                //         labelText: 'Minutes',
                //         hintStyle: TextStyle(inherit: false),
                //         counterText: '',
                //       ),
                //       controller: minuteField,
                //     ),
                //   ),
                // ),
                Container(
                  child: Expanded(
                    flex: 1,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Title'),
                      controller: titleField,
                    ),
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
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                color: Colors.white,
                textColor: Colors.green,
                child: Text(
                  'Add Activity',
                ),
                onPressed: () {
                  addActivity();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
