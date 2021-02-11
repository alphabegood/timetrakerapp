import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatefulWidget {
  final DateTime dayName;
  final String dayTimes;
  final double weekMinutes;
  final Function selectDateHandler;
  final DateTime currentDate;

  ChartBar(this.dayName, this.dayTimes, this.weekMinutes,
      this.selectDateHandler, this.currentDate);

  @override
  _ChartBarState createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  double maxHeight = 50;
  double filledBarHeight = 0;
  bool _selectedDate = false;

  _calculateBarPercent() {
    setState(() {
      _selectedDate = DateFormat('Mdy').format(widget.dayName) ==
          DateFormat('Mdy').format(widget.currentDate);

      var hours = widget.dayTimes.substring(0, 2);
      var minutes = widget.dayTimes.substring(3, 5);
      var dayMinutes = double.parse(minutes) + (double.parse(hours) * 60);

      // print(
      //  'BAR ${widget.dayName} ${widget.dayTimes} $dayMinutes ${widget.weekMinutes}');

      if (widget.weekMinutes > 0 && dayMinutes > 0) {
        // print('filledBarHeight ${widget.weekMinutes} $filledBarHeight');
        filledBarHeight = (dayMinutes / widget.weekMinutes) * maxHeight - 2;
      } else {
        filledBarHeight = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    _calculateBarPercent();
    return Column(
      children: [
        Text(widget.dayTimes),
        SizedBox(
          height: 5,
        ),
        Container(
          height: maxHeight,
          width: 12,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: filledBarHeight,
                color: Colors.red,
              )
            ],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            setState(() {
              print('Select On Tap ${widget.dayName}');
              widget.selectDateHandler(widget.dayName);
            });
          },
          child: Text(
            DateFormat('E, d').format(widget.dayName),
            style: TextStyle(
                fontWeight:
                    _selectedDate ? FontWeight.bold : FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
