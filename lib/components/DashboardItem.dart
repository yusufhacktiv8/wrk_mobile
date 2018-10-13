import 'package:dashboard/states/NetProfit.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/pages/NetProfitPage.dart';

const TITLE = 'Laba Bersih';

class DashboardItem extends StatefulWidget {
  final int month;
  final int year;

  DashboardItem({Key key, this.month, this.year}) : super(key: key);

  @override
  _DashboardItemState createState() => new _DashboardItemState();
}

class _DashboardItemState extends State<DashboardItem> {
  final NetProfitState netProfitState = new NetProfitState();
  int currentMonth = 0;

  @override
  void initState() {
    super.initState();
    _getNetProfits(widget.month, widget.year);
    eventBus.on<MonthYearChangedEvent>().listen((event) {
      _getNetProfits(event.monthYear.month, event.monthYear.year);
    });
  }

  _getNetProfits(int month, int year) async {
    if (!mounted) return;

    await netProfitState.getFromApi(month, year);
    setState(() {
//      if (netProfitState.error) {
//        _showError();
//      }
    });
  }

  void _showError() {
    Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text("An unknown error occurredx"),
        duration: new Duration(days: 1), // Make it permanent
        action: new SnackBarAction(
            label: "RETRY",
            onPressed: () {
//              _retry();
            })));
  }

  Widget _getLoadingStateWidget() {
    return new Center(
      child: new CircularProgressIndicator(),
    );
  }

  Widget _getSuccessStateWidget() {
    return ListTile(
      title: Text(TITLE, style: TextStyle(fontSize: 17.0)),
      subtitle: Text(netProfitState.netProfit.ra != null ? netProfitState.netProfit.ra.toString() : '0.0', style: TextStyle(fontSize: 25.0)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NetProfitPage(
              year: 2018,
              month: 1,
              projectType: 1
          )),
        );
      },

    );
  }

  Widget _getErrorState() {
    return ListTile(
      title: Text(TITLE, style: TextStyle(fontSize: 17.0)),
      subtitle: Text('-', style: TextStyle(fontSize: 25.0)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),

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
