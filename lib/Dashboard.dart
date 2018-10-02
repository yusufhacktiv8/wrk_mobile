import 'package:flutter/material.dart';
import 'package:dashboard/charts/MainCharts.dart';
import 'package:dashboard/components/DashboardItem.dart';
import 'package:dashboard/components/DashboardItem2.dart';
import 'package:dashboard/components/DashboardItem3.dart';
import 'package:dashboard/components/DashboardItem4.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_strip/month_picker_strip.dart';

class Dashboard extends StatelessWidget {
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
            initialMonth: new DateTime(2018, 1),
            height: 58.0,
            viewportFraction: 0.45,
            onMonthChanged: (v) {

            },
            normalTextStyle: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
            selectedTextStyle: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
          ),
          new MainCharts(),
          DashboardItem(),
          Divider(height: 1.0, color: Colors.grey,),
          DashboardItem2(),
          Divider(height: 1.0, color: Colors.grey,),
          DashboardItem3(),
          Divider(height: 1.0, color: Colors.grey,),
          DashboardItem4(),
        ],));
  }
}
