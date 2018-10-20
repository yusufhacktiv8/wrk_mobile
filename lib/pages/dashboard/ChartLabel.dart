import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/models/ChartData.dart';

class ChartLabel extends StatefulWidget {
  @override
  _ChartLabelState createState() => _ChartLabelState();
}

class _ChartLabelState extends State<ChartLabel> {
  final fn = new NumberFormat("#,###.00");
  ChartData chartData;
  @override
  void initState() {
    super.initState();
    eventBus.on<LineChartChangedEvent>().listen((event) {
      setState(() {
        this.chartData = event.data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final String ra = this.chartData != null ? fn.format(this.chartData.plan != 0 ? this.chartData.plan / 1000 : 0.0) : 'Ra';
    final String ri = this.chartData != null ? fn.format(this.chartData.actual != 0 ? this.chartData.actual / 1000 : 0.0) : 'Ri';
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(this.chartData != null ? _getMonthString(this.chartData.month) : 'Month',
            style: TextStyle(color: Colors.black, fontSize: 18.0)),
        Padding(padding: EdgeInsets.only(bottom: 8.0)),
        Row(
          children: <Widget>[
            Material(
//          padding: EdgeInsets.all(4.0),
              borderRadius: BorderRadius.circular(4.0),
              color: Color(0x8053DC9A),
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(ri,
                      style: TextStyle(color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.0))
              ),
            ),
            Padding(padding: EdgeInsets.only(right: 8.0)),
            Material(
//          padding: EdgeInsets.all(4.0),
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.blueAccent,
              child: Container(
                  padding: EdgeInsets.all(5.0),
                  child: Text(ra,
                      style: TextStyle(color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 19.0))
              ),
            ),
          ],
        ),
      ],
    );
  }

  String _getMonthString(int month) {
    switch (month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return "July";
      case 8:
        return "August";
      case 9:
        return "September";
      case 10:
        return "October";
      case 11:
        return "November";
      case 12:
        return "December";
    }
  }
}
