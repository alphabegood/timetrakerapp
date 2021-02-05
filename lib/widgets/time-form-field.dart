import 'package:flutter/material.dart';

class TimeFormField extends StatelessWidget {
  final String unitTimeLabel;
  final TextEditingController controllerField;

  TimeFormField(this.unitTimeLabel, this.controllerField);

  void _changeUnitTime(value) {
    if (value.length == 3) {
      controllerField.text = value.toString().substring(1);
      _pullCursorToRight();
      print('New Hour ${controllerField.text}');
    }
  }

  void _pullCursorToRight() {
    controllerField.selection = TextSelection(
      baseOffset: controllerField.text.length,
      extentOffset: controllerField.text.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: SizedBox(
        width: 70,
        child: TextField(
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          keyboardType: TextInputType.number,
          onChanged: _changeUnitTime,
          onTap: _pullCursorToRight,
          decoration: InputDecoration(
            labelText: unitTimeLabel,
            hintStyle: TextStyle(
              inherit: false,
              fontWeight: FontWeight.normal,
            ),
            counterText: '',
          ),
          controller: controllerField,
        ),
      ),
    );
  }
}
