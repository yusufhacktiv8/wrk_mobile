import 'package:dashboard/credit.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class CreditChart extends StatefulWidget {
  int year;
  CreditChart({Key key, this.year}) : super(key: key);

  @override
  _CreditChartState createState() => new _CreditChartState();
}

class _CreditChartState extends State<CreditChart>{
  final CreditState postState = new CreditState();
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

    List<Credit> _chartData = [new Credit(month: 0, pu: 0.0, tb: 0.0)];

    if (postState.posts.length > 0) {
      _chartData = postState.posts;
    }

    return Column(
      children: <Widget>[
        Container(height: 30.0, child: Text("Piutang", style: TextStyle(fontSize: 18.0),), alignment: Alignment.bottomCenter,),
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

  List<charts.Series<LinearCredit, int>> _createSampleData(List<Credit> credit) {
    List<LinearCredit> pus = new List<LinearCredit>();
    credit.forEach((element) {
      pus.add(new LinearCredit(element.month, element.pu, element.tb));
    });

    return [
      new charts.Series<LinearCredit, int>(
        id: 'Desktop',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearCredit credit, _) => credit.month,
        measureFn: (LinearCredit credit, _) => credit.pu,
        data: pus,
      )
      // Configure our custom bar target renderer for this series.
        ..setAttribute(charts.rendererIdKey, 'customArea'),
      new charts.Series<LinearCredit, int>(
        id: 'Tablet',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearCredit credit, _) => credit.month,
        measureFn: (LinearCredit credit, _) => credit.tb,
        data: pus,
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

class LinearCredit {
  final int month;
  final double pu;
  final double tb;

  LinearCredit(this.month, this.pu, this.tb);
}