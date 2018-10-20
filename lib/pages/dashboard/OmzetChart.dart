import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/models/ChartData.dart';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/components/charts/LineChart.dart';

class OmzetChart extends StatefulWidget {
  final int year;
  final String chartType;

  OmzetChart({Key key, this.year, this.chartType}) : super(key: key);

  @override
  _OmzetChartState createState() => new _OmzetChartState();
}

class _OmzetChartState extends State<OmzetChart> {
  List<ChartData> omzets = [];


  @override
  void initState() {
    eventBus.fire(LineChartChangedEvent(null));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFromApi(widget.year),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Container(
                height: 137.0,
                child: LineChart(data: snapshot.data, onChanged: (ChartData data) {
                  eventBus.fire(LineChartChangedEvent(data));
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
    try {
      var httpClient = new HttpClient();
      var request =
          await httpClient.getUrl(Uri.parse('$URL/$chartType?year=$year'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        return ChartData.fromJsonArray(json, planField, actualField);
      } else {
        return [];
      }
    } catch (exception) {
      return [];
    }
  }
}
