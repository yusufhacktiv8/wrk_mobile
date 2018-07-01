import 'package:dashboard/omzet_chart_stateful.dart';
import 'package:dashboard/sales_chart_stateful.dart';
import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          title: new Text("Dashboard"),
          bottom: new TabBar(
            tabs: [
              new Tab(icon: new Icon(Icons.show_chart), text: "Omzet Kontrak"),
              new Tab(icon: new Icon(Icons.show_chart), text: "Sales"),
              new Tab(icon: new Icon(Icons.insert_chart), text: "Piutang"),
            ],
          ),
        ),
        body: new TabBarView(
          children: [
            // ignore: not_enough_required_arguments
//            AreaAndLineChart.withSampleData(),
            new PostPage(),
            new SalesChart(),
            new Icon(Icons.insert_chart),
          ],
        ),
      ),
    );
  }
}