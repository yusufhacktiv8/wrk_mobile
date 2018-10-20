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
    return Text("$ra | $ri",
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 20.0));
  }
}
