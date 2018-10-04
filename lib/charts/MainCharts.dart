import 'package:flutter/material.dart';

import 'package:dashboard/charts/omzet_chart_stateful.dart';
import 'package:dashboard/charts/sales_chart_stateful.dart';
import 'package:dashboard/charts/credit_chart_stateful.dart';
import 'package:dashboard/summary_page.dart';
import 'package:dashboard/qmsl_page.dart';
import 'package:dashboard/DotsIndicator.dart';

class MainCharts extends StatelessWidget {
  int year;
  final _controller = new PageController();

  MainCharts({Key key, this.year}): super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> _pages = <Widget>[
      new OmzetChart(year: year),
      new SalesChart(year: year),
      new CreditChart(),
    ];

    return Container(
        height: 300.0,
        child: PageView.builder(
          physics: new AlwaysScrollableScrollPhysics(),
          controller: _controller,
          itemBuilder: (BuildContext context, int index) {
            return _pages[index % _pages.length];
          },
        ));
  }

/*
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new IconTheme(
        data: new IconThemeData(color: _kArrowColor),
        child: new Stack(
          children: <Widget>[
            new PageView.builder(
              physics: new AlwaysScrollableScrollPhysics(),
              controller: _controller,
              itemBuilder: (BuildContext context, int index) {
                return _pages[index % _pages.length];
              },
            ),
//            ListView(
//              padding: const EdgeInsets.all(2.0),
//              children: <Widget>[
//                new TextField(
//                  keyboardType: TextInputType.number,
//                  decoration: new InputDecoration(
//                      labelText: 'Age',
//                      hintText: 'e.g: 34',
//                      icon: new Icon(Icons.person_outline)),
//                ),
//              ],
//            )
          ],
        ),
      ),
    );
  } */
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
