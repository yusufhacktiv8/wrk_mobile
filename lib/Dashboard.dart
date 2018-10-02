import 'package:flutter/material.dart';
import 'package:dashboard/charts/MainCharts.dart';
import 'package:dashboard/components/DashboardItem.dart';
import 'package:dashboard/components/DashboardItem2.dart';
import 'package:dashboard/components/DashboardItem3.dart';
import 'package:dashboard/components/DashboardItem4.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard'),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
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
