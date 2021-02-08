import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ChartBar extends StatelessWidget {
  final DateTime dayName;
  final String totalTimes;

  ChartBar(this.dayName, this.totalTimes);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(totalTimes),
        Container(
          height: 50,
          width: 10,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black87,
            ),
          ),
        ),
        Text(
          DateFormat('E').format(dayName),
        ),
      ],
    );
  }
}
