import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_picker/flutter_picker.dart';

class MonthSelector extends StatefulWidget {
  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {

  final pickerData = '''
  [
    [
      "January",
      "February"
    ],
    [
      2017,
      2018
    ]
  ]
  ''';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        FlatButton(
          child: Text("January, 2018"),
          onPressed: () {
            new Picker(
                adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(pickerData), isArray: true),
                hideHeader: true,
                title: new Text("Select Month"),
                onConfirm: (Picker picker, List value) {
                  print(value.toString());
                  print(picker.getSelectedValues());
                  final val1 = picker.getSelectedValues()[0];
                  final val2 = picker.getSelectedValues()[1];
                }
            ).showDialog(context);
          },
        ),
      ],
    );
  }
}