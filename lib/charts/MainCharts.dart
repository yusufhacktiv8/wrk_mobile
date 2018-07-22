import 'package:flutter/material.dart';

import 'package:dashboard/omzet_chart_stateful.dart';
import 'package:dashboard/sales_chart_stateful.dart';
import 'package:dashboard/credit_chart_stateful.dart';
import 'package:dashboard/summary_page.dart';
import 'package:dashboard/qmsl_page.dart';
import 'package:dashboard/DotsIndicator.dart';

class MainCharts extends StatelessWidget {
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  final _kArrowColor = Colors.black.withOpacity(0.8);

  final List<Widget> _pages = <Widget>[
    new PostPage(),
    new SalesChart(),
    new CreditChart(),
  ];

  @override
  Widget build(BuildContext context) {
//    return new PageView.builder(
//      physics: new AlwaysScrollableScrollPhysics(),
//      controller: _controller,
//      itemBuilder: (BuildContext context, int index) {
//        return _pages[index % _pages.length];
//      },
//    );
    return Container(
      height: 300.0,
      child: PageView.builder(
      physics: new AlwaysScrollableScrollPhysics(),
        controller: _controller,
        itemBuilder: (BuildContext context, int index) {
          return _pages[index % _pages.length];
        },
      )
    );
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
