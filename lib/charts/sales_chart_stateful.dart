import 'package:dashboard/sales.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class SalesChart extends StatefulWidget {
  int year;
  SalesChart({Key key, this.year}) : super(key: key);

  @override
  _SalesChartState createState() => new _SalesChartState();
}

class _SalesChartState extends State<SalesChart>{
  final SalesState postState = new SalesState();
  int currentYear = 0;

  @override
  void initState() {
    super.initState();
  }

  _getPosts(int year) async {
    if (!mounted) return;

    await postState.getFromApi(year);
    setState((){

    });
  }

  _retry(){
    Scaffold.of(context).removeCurrentSnackBar();
    postState.reset();
    setState((){});
    _getPosts(widget.year);
  }

  void _showError(){
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("An unknown error occurredx"),
        duration: new Duration(days: 1), // Make it permanent
        action: new SnackBarAction(
            label : "RETRY",
            onPressed : (){_retry();}
        )
    ));
  }

  Widget _getLoadingStateWidget(){
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget _getSuccessStateWidget(){

    List<Sales> _chartData = [new Sales(month: 0, plan: 0.0, actual: 0.0)];

    if (postState.posts.length > 0) {
      _chartData = postState.posts;
    }
    return Column(
      children: <Widget>[
        Container(height: 30.0, child: Text("Sales", style: TextStyle(fontSize: 18.0),), alignment: Alignment.bottomCenter,),
        Container(
            height: 270.0,
            child: new charts.LineChart(_createSampleData(_chartData),
                animate: true,
                customSeriesRenderers: [
                  new charts.LineRendererConfig(
                    // ID used to link series to this renderer.
                      customRendererId: 'customArea',
                      includeArea: true,
                      stacked: true),
                ]))
      ],
    );
  }

  List<charts.Series<LinearSales, int>> _createSampleData(List<Sales> sales) {
    List<LinearSales> plans = new List<LinearSales>();
    sales.forEach((element) {
      plans.add(new LinearSales(element.month, element.plan, element.actual));
    });

    return [
      new charts.Series<LinearSales, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.plan,
        data: plans,
      )
      // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customArea'),
      new charts.Series<LinearSales, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.month,
        measureFn: (LinearSales sales, _) => sales.actual,
        data: plans,
      ),
    ];
  }

  Widget _getErrorState(){
    return new Center(
      child: new Row(),
    );
  }

  Widget getCurrentStateWidget(){
    Widget currentStateWidget;
    if(!postState.error && !postState.loading) {
      currentStateWidget = _getSuccessStateWidget();
    }
    else if(!postState.error){
      currentStateWidget = _getLoadingStateWidget();
    }
    else{
      currentStateWidget = _getErrorState();
    }
    return currentStateWidget;
  }

  @override
  Widget build(BuildContext context) {
    if (currentYear != widget.year) {
      currentYear = widget.year;
      _getPosts(widget.year);
    }
    return getCurrentStateWidget();
  }
}

class LinearSales {
  final int month;
  final double plan;
  final double actual;

  LinearSales(this.month, this.plan, this.actual);
}