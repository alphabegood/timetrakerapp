import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NoActivityGraphic extends StatefulWidget {
  final DateTime selectedDate;

  NoActivityGraphic(this.selectedDate);
  @override
  _NoActivityGraphicState createState() => _NoActivityGraphicState();
}

class _NoActivityGraphicState extends State<NoActivityGraphic> {
  String dateStr = 'today';

  checkDate() {
    setState(() {
      if (DateFormat('Mdy').format(widget.selectedDate) ==
          DateFormat('Mdy').format(DateTime.now())) {
        dateStr = 'today';
      } else {
        dateStr = DateFormat('EEEE, d MMMM ').format(widget.selectedDate);
      }
    });
  }

  _NoActivityGraphicState();
  @override
  Widget build(BuildContext context) {
    checkDate();
    return Container(
      child: LayoutBuilder(builder: (context, constraints) {
        return Column(
          children: [
            Text(
              'No activities added yet for ${dateStr}!',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
            ),
            Container(
              height: constraints.maxHeight * 0.6,
              padding: EdgeInsets.only(top: 10),
              child: Image.asset(
                'assets/images/sleepytime.png',
                fit: BoxFit.fitHeight,
              ),
            ),
          ],
        );
      }),
    );
  }
}
