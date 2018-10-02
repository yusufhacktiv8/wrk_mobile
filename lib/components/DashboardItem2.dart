import 'package:dashboard/states/Project.dart';
import 'package:flutter/material.dart';

const TITLE = 'Proyek Kons & Fab';

class DashboardItem2 extends StatefulWidget {
  DashboardItem2({Key key}) : super(key: key);

  @override
  _DashboardItemState2 createState() => new _DashboardItemState2();
}

class _DashboardItemState2 extends State<DashboardItem2> {
  final ProjectState projectState = new ProjectState();
  BuildContext context;

  @override
  void initState() {
    super.initState();
    _getProjects();
  }

  _getProjects() async {
    if (!mounted) return;

    await projectState.getFromApi();
    setState(() {
//      if (projectState.error) {
//        _showError();
//      }
    });
  }

  _retry() {
    Scaffold.of(context).removeCurrentSnackBar();
    projectState.reset();
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
      subtitle: Text(projectState.project.score != null ? projectState.project.score.toString() : '0.0', style: TextStyle(fontSize: 25.0)),
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
    if (!projectState.error && !projectState.loading) {
      currentStateWidget = _getSuccessStateWidget();
    } else if (!projectState.error) {
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
