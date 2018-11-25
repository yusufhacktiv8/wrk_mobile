import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:month_picker_strip/month_picker_strip.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/pages/dashboard/MonthSelector.dart';
import 'package:dashboard/pages/dashboard/OmzetChart.dart';
import 'package:dashboard/pages/dashboard/ChartLabel.dart';
import 'package:dashboard/pages/dashboard/NetProfitTile.dart';
import 'package:dashboard/pages/dashboard/ProjectCountTile.dart';
import 'package:dashboard/pages/hasilusaha/HasilUsahaPage.dart';
import 'package:dashboard/pages/project/ProjectPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/Constant.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  Timer _timer;
  final fn = new NumberFormat("#,###.00");
  var plan = 0.0;
  var year = 2018;
  final List<List<double>> charts =
  [
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4,],
    [0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4, 0.0, 0.3, 0.7, 0.6, 0.55, 0.8, 1.2, 1.3, 1.35, 0.9, 1.5, 1.7, 1.8, 1.7, 1.2, 0.8, 1.9, 2.0, 2.2, 1.9, 2.2, 2.1, 2.0, 2.3, 2.4, 2.45, 2.6, 3.6, 2.6, 2.7, 2.9, 2.8, 3.4]
  ];

  static final List<String> chartDropdownItems = [
    'Omzet',
    'Sales',
    'Piutang'
  ];
  String actualDropdown = chartDropdownItems[0];
  int actualChart = 0;
  DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDateTime = DateTime(now.year, now.month - 1, now.day);
    eventBus.on<MonthYearChangedEvent>().listen((event) {
      this._selectedDateTime = event.dateTime;
    });
    _timer = new Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        eventBus.fire(MonthYearChangedEvent(_selectedDateTime));
        eventBus.fire(YearChangedEvent(_selectedDateTime));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    String chartType;
    switch(actualChart) {
      case 0:
        chartType = 'omzets';
        break;
      case 1:
        chartType = 'sales';
        break;
      case 2:
        chartType = 'creditsbyyear';
        break;
      default:
        chartType = 'omzets';
    }

    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          elevation: 2.0,
          backgroundColor: Colors.white,
          title: Text('Dashboard',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: 30.0)),
          actions: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  FutureBuilder (
                      future: _getUserName(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Text(snapshot.data,
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14.0));
                        } else {
                          return Text('-',
                          style: TextStyle(
                          color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 14.0));
                        }
                      }
                  ),
                  Icon(Icons.arrow_drop_down, color: Colors.black54)
                ],
              ),
            )
          ],
        ),
        body: Column(
          children: <Widget>[
            MonthSelector(
              selectedDateTime: this._selectedDateTime,
            ),
            Expanded(
              child: StaggeredGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                children: <Widget>[
                  _buildTile(
                    Padding(
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 15.0, bottom: 0.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                ChartLabel(),
                                DropdownButton(
                                    isDense: true,
                                    value: actualDropdown,
                                    onChanged: (String value) {
                                      setState(() {
                                        actualDropdown = value;
                                        actualChart = chartDropdownItems
                                            .indexOf(value); // Refresh the chart
                                      });
                                      eventBus.fire(LineChartChangedEvent(null));
                                    },
                                    items: chartDropdownItems.map((String title) {
                                      return DropdownMenuItem(
                                        value: title,
                                        child: Text(title,
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18.0)),
                                      );
                                    }).toList())
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 1.0)),
//                      Sparkline(
//                        data: charts[actualChart],
//                        lineWidth: 5.0,
//                        lineColor: Colors.greenAccent,
//                      )
                            OmzetChart(chartType: chartType,),
                          ],
                        )),
                  ),
                  _buildTile(
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Laba Bersih',
                                    style: TextStyle(color: Colors.blueAccent, fontSize: 18.0)),
                                NetProfitTile()
                              ],
                            ),
                            Material(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(24.0),
                                child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Icon(Icons.timeline,
                                          color: Colors.white, size: 30.0),
                                    )))
                          ]),
                    ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HasilUsahaPage(selectedDateTime: this._selectedDateTime,)),
                        );
                      }
                  ),
                  _buildTile(
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Material(
                                color: Colors.teal,
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Icon(Icons.subtitles,
                                      color: Colors.white, size: 30.0),
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 16.0)),
                            Text('Kons & Fab',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0)),
                            Row(
                              children: <Widget>[
                                ProjectCountTile(projectType: 1,),
                                Padding(padding: EdgeInsets.only(right: 6.0),),
                                Text('Projects', style: TextStyle(color: Colors.black54, fontSize: 17.0)),
                              ],
                            ),
                          ]),
                    ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProjectPage(selectedDateTime: this._selectedDateTime, projectType: 1,)),
                        );
                      }
                  ),
                  _buildTile(
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Material(
                                color: Colors.amber,
                                shape: CircleBorder(),
                                child: Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Icon(Icons.subtitles,
                                      color: Colors.white, size: 30.0),
                                )),
                            Padding(padding: EdgeInsets.only(bottom: 16.0)),
                            Text('O & M',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0)),
                            Row(
                              children: <Widget>[
                                ProjectCountTile(projectType: 2,),
                                Padding(padding: EdgeInsets.only(right: 6.0),),
                                Text('Projects', style: TextStyle(color: Colors.black54, fontSize: 17.0)),
                              ],
                            ),
                          ]),
                    ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ProjectPage(selectedDateTime: this._selectedDateTime, projectType: 2,)),
                        );
                      }
                  ),
                  _buildTile(
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Score Card',
                                    style: TextStyle(color: Colors.redAccent)),
                                Text('-',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 34.0))
                              ],
                            ),
                            Material(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(24.0),
                                child: Center(
                                    child: Padding(
                                      padding: EdgeInsets.all(16.0),
                                      child: Icon(Icons.developer_board,
                                          color: Colors.white, size: 30.0),
                                    )))
                          ]),
                    ),
//              onTap: () => Navigator
//                  .of(context)
//                  .push(MaterialPageRoute(builder: (_) => ShopItemsPage())),
                  )
                ],
                staggeredTiles: [
                  StaggeredTile.extent(2, 220.0),
                  StaggeredTile.extent(2, 110.0),
                  StaggeredTile.extent(1, 180.0),
                  StaggeredTile.extent(1, 180.0),
                  StaggeredTile.extent(2, 110.0),
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            // Do onTap() if it isn't null, otherwise do print()
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('Not set yet');
                  },
            child: child));
  }

  Future<String> _getUserName() async {
    String token = await _getMobileToken();
    var jwt = parseJwt(token);
    return jwt["name"];
  }

  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(MOBILE_TOKEN_KEY) ?? '';
  }

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }
}
