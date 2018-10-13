import 'package:flutter/material.dart';
import 'package:month_picker_strip/month_picker_strip.dart';
import 'package:dashboard/DotsIndicator.dart';

class HasilUsahaPage extends StatefulWidget {
  final int year, month, projectType;
  HasilUsahaPage({Key key, this.year, this.month, this.projectType}) : super(key: key);

  @override
  _HasilUsahaPageState createState() => new _HasilUsahaPageState();
}

class _HasilUsahaPageState extends State<HasilUsahaPage> {

  DateTime _selectedMonth;
  final _controller = new PageController();

  static const _kDuration = const Duration(milliseconds: 300);

  static const _kCurve = Curves.ease;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Hasil Usaha'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            MonthStrip(
              format: 'MMM yyyy',
              from: new DateTime(2016, 4),
              to: new DateTime(2018, 5),
              initialMonth: _selectedMonth,
              height: 58.0,
              viewportFraction: 0.45,
              onMonthChanged: (v) {
                setState(() {
                  _selectedMonth = v;
//                  _getProjectProgress();
                });
              },
              normalTextStyle: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
              selectedTextStyle: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
            ),
            DotsIndicator(
              color: Colors.blueGrey,
              itemCount: 2,
              controller: _controller,
              onPageSelected: (int page) {
                if (!mounted) return;
                _controller.animateToPage(
                  page,
                  duration: _kDuration,
                  curve: _kCurve,
                );
              },
            ),
            Expanded(
                child: PageView(
                    physics: new AlwaysScrollableScrollPhysics(),
                    controller: _controller,
                    children: <Widget>[
                      Text("Hello"),
                      Text("World"),
                    ],
                )
            )

          ],
        ),
    );
  }

}