import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:dashboard/models/ChartData.dart';

class LineChart extends StatelessWidget {

  final List<ChartData> data;
  final ValueChanged<ChartData> onChanged;

  LineChart({Key key, this.data, @required this.onChanged}) : super(key: key);

  _onSelectionChanged(charts.SelectionModel model) {
      final selectedDatum = model.selectedDatum;
      final data1 = selectedDatum[0].datum;
      final month1 = data1.month;
      final plan1 = data1.plan;
      final actual1 = data1.actual;
      this.onChanged(ChartData(month: month1, plan: plan1, actual: actual1));
    }

  @override
  Widget build(BuildContext context) {
    if (this.data != null && this.data.length == 0) {
      return Text("No data");
    }
    return charts.LineChart(_createSeries(this.data),
        primaryMeasureAxis: charts.NumericAxisSpec(renderSpec: new charts.NoneRenderSpec()),
        domainAxis: new charts.NumericAxisSpec(
          tickProviderSpec: new charts.StaticNumericTickProviderSpec(
            <charts.TickSpec<num>>[
              charts.TickSpec<num>(1),
              charts.TickSpec<num>(2),
              charts.TickSpec<num>(3),
              charts.TickSpec<num>(4),
              charts.TickSpec<num>(5),
              charts.TickSpec<num>(6),
              charts.TickSpec<num>(7),
              charts.TickSpec<num>(8),
              charts.TickSpec<num>(9),
              charts.TickSpec<num>(10),
              charts.TickSpec<num>(11),
              charts.TickSpec<num>(12),
            ],
          ),
            showAxisLine: false,),
//            renderSpec: new charts.NoneRenderSpec()),
        selectionModels: [
          new charts.SelectionModelConfig(
            type: charts.SelectionModelType.info,
            listener: _onSelectionChanged,
          )
        ],
        animate: true,
        customSeriesRenderers: [
          new charts.LineRendererConfig(
              customRendererId: 'customArea',
              includeArea: true,
              stacked: true),
        ],
//        behaviors: [
//          new charts.InitialSelection(selectedDataConfig: [
//            new charts.SeriesDatumConfig<int>('planSeries', 3)
//          ])
//        ]
    );
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

  String _getMonthName(int month) {
    switch (month) {
      case 1:
        return "Jan";
      default:
        return month.toString();
    }
  }
}

//class ChartData {
//  final int month;
//  final double plan;
//  final double actual;
//
//  ChartData(this.month, this.plan, this.actual);
//}