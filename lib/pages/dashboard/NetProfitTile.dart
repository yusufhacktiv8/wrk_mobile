import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/models/NetProfit.dart';

class NetProfitTile extends StatefulWidget {
  @override
  _NetProfitTileState createState() => _NetProfitTileState();
}

class _NetProfitTileState extends State<NetProfitTile> {
  final fn = new NumberFormat("#,###.00");
  DateTime selectedDateTime;


  @override
  void initState() {
    super.initState();
    this.selectedDateTime = DateTime.now();
    eventBus.on<MonthYearChangedEvent>().listen((event) {
      setState(() {
        this.selectedDateTime = event.dateTime;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _getFromApi(this.selectedDateTime),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.ra != null) {
              return Text(fn.format(snapshot.data.ra),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0));
            } else {
              return Text('-',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 30.0));
            }
          } else {
            return new CircularProgressIndicator();
          }
        });
  }

  Future<void> _getFromApi(DateTime dateTime) async {
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse('$URL/netprofit?year=${dateTime.year}&month=${dateTime.month}'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        return NetProfit.fromJson(json);
      } else {
        return NetProfit();
      }
    } catch (exception) {
      return NetProfit();
    }
  }
}
