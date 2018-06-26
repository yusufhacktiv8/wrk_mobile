import 'package:dashboard/omzet.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  @override
  _PostPageState createState() => new _PostPageState();
}

class _PostPageState extends State<PostPage>{
  final OmzetState postState = new OmzetState();
  BuildContext context;

  @override
  void initState() {
    super.initState();
    _getPosts();
  }

  _getPosts() async {
    if (!mounted) return;

    await postState.getFromApi();
    setState((){
      if(postState.error){
        _showError();
      }
    });
  }

  _retry(){
    Scaffold.of(context).removeCurrentSnackBar();
    postState.reset();
    setState((){});
    _getPosts();
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

//  Widget _getSuccessStateWidget(){
//    return new ListView.builder(
//        itemCount: postState.posts.length,
//        itemBuilder: (context, index) {
//          return new Column(
//              crossAxisAlignment: CrossAxisAlignment.start,
//              children: <Widget>[
//                new Text(postState.posts[index].month.toString(),
//                    style: new TextStyle(fontWeight: FontWeight.bold)),
//
//                new Text(postState.posts[index].plan.toString()),
//
//                new Divider()
//              ]
//          );
//        }
//    );
//  }

  Widget _getSuccessStateWidget(){
    return new charts.LineChart(_createSampleData(postState.posts),
        animate: true,
        customSeriesRenderers: [
          new charts.LineRendererConfig(
            // ID used to link series to this renderer.
              customRendererId: 'customArea',
              includeArea: true,
              stacked: true),
        ]);
  }

  List<charts.Series<LinearSales, int>> _createSampleData(List<Omzet> omzets) {
    List<LinearSales> plans = new List<LinearSales>();
    omzets.forEach((element) {
      plans.add(new LinearSales(element.month, element.plan, element.actual));
    });
//    final myFakeDesktopData = [
//      new LinearSales(0, 5),
//      new LinearSales(1, 25),
//      new LinearSales(2, 100),
//      new LinearSales(3, 75),
//    ];

//    var myFakeTabletData = [
//      new LinearSales(0, 10.1),
//      new LinearSales(1, 50.2),
//      new LinearSales(2, 200.3),
//      new LinearSales(3, 150.4),
//    ];

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
//    Widget currentWidget = getCurrentStateWidget();
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text('FeedMe'),
//        ),
//        body: new Builder(builder: (BuildContext context) {
//          this.context = context;
//          return currentWidget;
//        })
//    );
    return getCurrentStateWidget();
  }
}

class LinearSales {
  final int month;
  final double plan;
  final double actual;

  LinearSales(this.month, this.plan, this.actual);
}