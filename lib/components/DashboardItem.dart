import 'package:dashboard/states/NetProfit.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class DashboardItem extends StatefulWidget {
  DashboardItem({Key key}) : super(key: key);

  @override
  _DashboardItemState createState() => new _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  final NetProfitState netProfitState = new NetProfitState();
  BuildContext context;

  @override
  void initState() {
    super.initState();
    _getNetProfits();
  }

  _getNetProfits() async {
    if (!mounted) return;

    await netProfitState.getFromApi();
    setState(() {
      if (netProfitState.error) {
        _showError();
      }
    });
  }

  _retry() {
    Scaffold.of(context).removeCurrentSnackBar();
    netProfitState.reset();
    setState(() {});
    _getNetProfits();
  }

  void _showError() {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("An unknown error occurredx"),
        duration: new Duration(days: 1), // Make it permanent
        action: new SnackBarAction(
            label: "RETRY",
            onPressed: () {
              _retry();
            })));
  }

  Widget _getLoadingStateWidget() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget _getSuccessStateWidget() {
    return ListTile(
      title: Text("Laba Bersih", style: TextStyle(fontSize: 17.0)),
      subtitle: Text(netProfitState.netProfit.ra != null ? netProfitState.netProfit.ra.toString() : '0.0', style: TextStyle(fontSize: 25.0)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),

    );
  }

  Widget _getErrorState() {
    return new Center(
      child: new Row(),
    );
  }

  Widget getCurrentStateWidget() {
    Widget currentStateWidget;
    if (!netProfitState.error && !netProfitState.loading) {
      currentStateWidget = _getSuccessStateWidget();
    } else if (!netProfitState.error) {
      currentStateWidget = _getLoadingStateWidget();
    } else {
      currentStateWidget = _getErrorState();
    }
    return currentStateWidget;
  }

  @override
  Widget build(BuildContext context) {
    return getCurrentStateWidget();
  }
}
