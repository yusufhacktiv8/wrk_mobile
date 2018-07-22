import 'package:flutter/material.dart';
import 'package:dashboard/charts/MainCharts.dart';

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
          ListTile(
            title: Text("Hello"),
          ),
          ListTile(
            title: Text("Yusuf"),
          )
        ],));
  }
}
