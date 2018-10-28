import 'package:flutter/material.dart';
import 'package:dashboard/charts/MainCharts.dart';
import 'package:dashboard/components/DashboardItem.dart';
import 'package:dashboard/components/DashboardItem2.dart';
import 'package:dashboard/components/DashboardItem4.dart';
import 'package:month_picker_strip/month_picker_strip.dart';
import 'package:dashboard/events.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key key}) : super(key: key);

  @override
  _DashboardState createState() => new _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = new DateTime(2018, 1);
  }
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard'),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
          new MonthStrip(
            format: 'MMM yyyy',
            from: new DateTime(2016, 4),
            to: new DateTime(2018, 5),
            initialMonth: _selectedDateTime,
            height: 58.0,
            viewportFraction: 0.45,
            onMonthChanged: (v) {
              setState(() {
                _selectedDateTime = v;
                eventBus.fire(new MonthYearChangedEvent(v));
              });
            },
            normalTextStyle: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
            selectedTextStyle: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
          ),
          new MainCharts(year: _selectedDateTime.year),
          DashboardItem(selectedDateTime: _selectedDateTime,),
          Divider(height: 1.0, color: Colors.grey,),
          DashboardItem2(projectType: 1, title: 'Kons & Fab',),
          Divider(height: 1.0, color: Colors.grey,),
          DashboardItem2(projectType: 2, title: 'O & M'),
          Divider(height: 1.0, color: Colors.grey,),
          DashboardItem4(),
        ],));
  }

}
