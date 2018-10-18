import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dashboard/models/ChartData.dart';

class LineChart extends StatelessWidget {

  final List<ChartData> data;

  LineChart({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.data != null && this.data.length == 0) {
      return Text("No data");
    }
    return charts.LineChart(_createSeries(this.data),
        animate: true,
        customSeriesRenderers: [
          new charts.LineRendererConfig(
              customRendererId: 'customArea',
              includeArea: true,
              stacked: true),
        ]);
  }

  List<charts.Series<ChartData, int>> _createSeries(List<ChartData> data) {
    return [
      new charts.Series<ChartData, int>(
        id: 'planSeries',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (ChartData chartData, _) => chartData.month,
        measureFn: (ChartData chartData, _) => chartData.plan,
        data: data,
      )
        ..setAttribute(charts.rendererIdKey, 'customArea'),
      new charts.Series<ChartData, int>(
        id: 'actualSeries',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (ChartData chartData, _) => chartData.month,
        measureFn: (ChartData chartData, _) => chartData.actual,
        data: data,
      ),
    ];
  }
}

//class ChartData {
//  final int month;
//  final double plan;
//  final double actual;
//
//  ChartData(this.month, this.plan, this.actual);
//}