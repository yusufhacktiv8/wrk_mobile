import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:dashboard/events.dart';

class MonthSelector extends StatefulWidget {
  BuildContext parentContext;
  Color textColor;
  DateTime selectedDateTime;
  ValueSetter onChange;

  MonthSelector({Key key, this.parentContext, this.textColor, this.selectedDateTime, this.onChange}) : super(key: key);
  @override
  _MonthSelectorState createState() => _MonthSelectorState();
}

class _MonthSelectorState extends State<MonthSelector> {
  final f = new DateFormat('MMM');

  DateTime selectedDateTime;

  String _getYears() {
    DateTime now = new DateTime.now();
    int year = now.year;
    List years = [];
    for(int i=year; i > year - 5; i--) {
      years.add("$i");
    }

    return years.join(",");
  }

  String _getPickerData() {
    return '''
  [
    [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ],
    [
      ${_getYears()}
    ]
  ]
  ''';
  }

//  var pickerData =

  int _getMonthFormString(String month) {
    switch(month) {
      case 'January':
        return 1;
      case 'February':
        return 2;
      case 'March':
        return 3;
      case 'April':
        return 4;
      case 'May':
        return 5;
      case 'June':
        return 6;
      case 'July':
        return 7;
      case 'August':
        return 8;
      case 'September':
        return 9;
      case 'October':
        return 10;
      case 'November':
        return 11;
      case 'December':
        return 12;
    }
  }

  @override
  void initState() {
    super.initState();
    this.selectedDateTime = widget.selectedDateTime != null ? widget.selectedDateTime : DateTime.now();
    eventBus.on<MonthYearChangedEvent>().listen((event) {
      if (mounted) {
        setState(() {
          this.selectedDateTime = event.dateTime;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String monthStr = f.format(this.selectedDateTime);
    int year = this.selectedDateTime.year;
    final selecteds = [this.selectedDateTime.month - 1, this.selectedDateTime.year - 2016];
    String monthYearText = "$monthStr, $year";
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text(monthYearText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: widget.textColor != null ? widget.textColor : Colors.lightBlue),
          ),
          onPressed: () {
            new Picker(
              selecteds: selecteds,
                adapter: PickerDataAdapter<String>(pickerdata: new JsonDecoder().convert(_getPickerData()), isArray: true),
                hideHeader: true,
                title: new Text("Select Month"),
                onConfirm: (Picker picker, List value) {
//                  print(value.toString());
//                  print(picker.getSelectedValues());
                  final month = picker.getSelectedValues()[0];
                  final year = picker.getSelectedValues()[1];
                  var dateTime = DateTime(int.parse(year), _getMonthFormString(month));
                  eventBus.fire(MonthYearChangedEvent(dateTime));
                  eventBus.fire(YearChangedEvent(dateTime));
                  eventBus.fire(LineChartChangedEvent(null));
                  setState(() {
                    this.selectedDateTime = dateTime;
                  });
                  if (widget.onChange != null) {
                    widget.onChange(dateTime);
                  }
                }
            ).showDialog(widget.parentContext != null ? widget.parentContext : context);
          },
        ),
      ],
    );
  }
}