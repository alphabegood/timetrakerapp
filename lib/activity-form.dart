import 'package:flutter/material.dart';
import 'activity.dart';

class ActivityForm extends StatelessWidget {
  final Function addActivityHandler;

  final hourField = TextEditingController();
  final minuteField = TextEditingController();
  final titleField = TextEditingController();
  final detailsField = TextEditingController();

  ActivityForm(this.addActivityHandler);

  void addTransaction() {
    final activity = Activity().setActivity(
        hourField.text, minuteField.text, titleField.text, detailsField.text);

    addActivityHandler(activity);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Hours'),
                      controller: hourField,
                      autofocus: true,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  child: SizedBox(
                    width: 100,
                    child: TextField(
                      decoration: InputDecoration(labelText: 'Minutes'),
                      controller: minuteField,
                    ),
                  ),
                ),
                Container(
                  width: 730,
                  child: SizedBox(
                    width: double.maxFinite,
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
                onPressed: () => addTransaction(),
              ),
            )
          ],
        ));
  }
}
