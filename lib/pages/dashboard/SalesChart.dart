import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:dashboard/models/ChartData.dart';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/components/charts/LineChart.dart';

class SalesChart extends StatefulWidget {
  final int year;

  SalesChart({Key key, this.year}) : super(key: key);

  @override
  _SalesChartState createState() => new _SalesChartState();
}

class _SalesChartState extends State<SalesChart> {
  List<ChartData> omzets = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFromApi(widget.year),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null) {
              return Container(
                height: 112.0,
                child: LineChart(data: snapshot.data,),
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
    try {
      var httpClient = new HttpClient();
      var request =
          await httpClient.getUrl(Uri.parse('$URL/sales?year=$year'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        return ChartData.fromJsonArray(json);
      } else {
        return [];
      }
    } catch (exception) {
      return [];
    }
  }
}
