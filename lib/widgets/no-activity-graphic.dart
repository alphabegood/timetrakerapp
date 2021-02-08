import 'package:flutter/material.dart';

class NoActivityGraphic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'No activities added yet for today!',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
          ),
          SizedBox(
            height: 20,
          ),
          Image.asset(
            'assets/images/sleepytime.png',
            fit: BoxFit.fitHeight,
          ),
        ],
      ),
    );
  }
}
