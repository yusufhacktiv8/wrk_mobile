import 'package:dashboard/states/ScoreCard.dart';
import 'package:flutter/material.dart';

const TITLE = 'Score Card';

class DashboardItem4 extends StatefulWidget {
  DashboardItem4({Key key}) : super(key: key);

  @override
  _DashboardItemState4 createState() => new _DashboardItemState4();
}

class _DashboardItemState4 extends State<DashboardItem4> {
  final ScoreCardState scoreCardState = new ScoreCardState();
  BuildContext context;

  @override
  void initState() {
    super.initState();
    _getProjects();
  }

  _getProjects() async {
    if (!mounted) return;

    await scoreCardState.getFromApi();
    setState(() {
//      if (scoreCardState.error) {
//        _showError();
//      }
    });
  }

  _retry() {
    Scaffold.of(context).removeCurrentSnackBar();
    scoreCardState.reset();
    setState(() {});
    _getProjects();
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
      title: Text(TITLE, style: TextStyle(fontSize: 17.0)),
      subtitle: Text(scoreCardState.project.score != null ? scoreCardState.project.score.toString() : '0.0', style: TextStyle(fontSize: 25.0)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),

    );
  }

  Widget _getErrorState() {
    return ListTile(
      title: Text(TITLE, style: TextStyle(fontSize: 17.0)),
      subtitle: Text('-'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),

    );
  }

  Widget getCurrentStateWidget() {
    Widget currentStateWidget;
    if (!scoreCardState.error && !scoreCardState.loading) {
      currentStateWidget = _getSuccessStateWidget();
    } else if (!scoreCardState.error) {
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
