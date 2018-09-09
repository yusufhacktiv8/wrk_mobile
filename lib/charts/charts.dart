import 'package:dashboard/charts/omzet_chart_stateful.dart';
import 'package:dashboard/charts/sales_chart_stateful.dart';
import 'package:dashboard/charts/credit_chart_stateful.dart';
import 'package:dashboard/summary_page.dart';
import 'package:dashboard/qmsl_page.dart';
import 'package:flutter/material.dart';

class TabBarDemo extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    void _select(Choice choice) {
      if (choice.title == 'Summary') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SummaryPage()),
        );
      } else if (choice.title == 'QMSL') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QmslPage()),
        );
      }

    }
    return new DefaultTabController(
      length: 3,
      child: new Scaffold(
        appBar: new AppBar(
          centerTitle: true,
          actions: [
            PopupMenuButton<Choice>(
              onSelected: _select,
              itemBuilder: (BuildContext context) {
                return choices.map((Choice choice) {
                  return PopupMenuItem<Choice>(
                    value: choice,
                    child: Text(choice.title),
                  );
                }).toList();
              },
            ),
          ],
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
            new OmzetChart(),
            new SalesChart(),
            new CreditChart(),
          ],
        ),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Summary', icon: Icons.directions_car),
  const Choice(title: 'QMSL', icon: Icons.directions_bike),
];