import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/models/ChartData.dart';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/components/charts/LineChart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dashboard/Constant.dart';

Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

class OmzetChart extends StatefulWidget {
  final String chartType;

  OmzetChart({Key key, this.chartType}) : super(key: key);

  @override
  _OmzetChartState createState() => new _OmzetChartState();
}

class _OmzetChartState extends State<OmzetChart> {
  List<ChartData> omzets = [];
  DateTime selectedDateTime;

  @override
  void initState() {
    super.initState();
    selectedDateTime = DateTime.now();
    eventBus.on<YearChangedEvent>().listen((event) {
      setState(() {
        this.selectedDateTime = event.dateTime;
      });
    });
    eventBus.fire(LineChartChangedEvent(null));
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _getFromApi(this.selectedDateTime.year),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Container(
                height: 132.0,
                child: LineChart(data: snapshot.data, onChanged: (ChartData data) {
                  var dateTime = DateTime(this.selectedDateTime.year, data.month);
                  eventBus.fire(LineChartChangedEvent(data));
                  eventBus.fire(MonthYearChangedEvent(dateTime));
                }),
              );
            } else {
              return new CircularProgressIndicator();
            }
          } else {
            return new CircularProgressIndicator();
          }
        });
  }

  Future<void> _getFromApi(int year) async {
    final chartType = widget.chartType;
    String planField = chartType == 'creditsbyyear' ?'pu' : 'plan';
    String actualField = chartType == 'creditsbyyear' ?'tb' : 'actual';
    String token = await _getMobileToken();
    List<ChartData> emptyResult = [];
    try {
      var httpClient = new HttpClient();
      var request =
          await httpClient.getUrl(Uri.parse('$URL/$chartType?year=$year'));
      request.headers.set('Authorization', 'Bearer $token');
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        return ChartData.fromJsonArray(json, planField, actualField);
      } else if (response.statusCode == HttpStatus.forbidden) {
//        _showDialog("Session Expired", "Please login", _context);
        Scaffold.of(context).showSnackBar(new SnackBar(
          content: new Text('Session Expired'),
        ));
        return emptyResult;
      } else {
        return emptyResult;
      }
    } catch (exception) {
      Scaffold.of(context).showSnackBar(new SnackBar(
        content: new Text('Connection Error'),
      ));
      return emptyResult;
    }
  }

  Future<String> _getMobileToken() async {
    final SharedPreferences prefs = await _prefs;

    return prefs.getString(MOBILE_TOKEN_KEY) ?? '';
  }
}
