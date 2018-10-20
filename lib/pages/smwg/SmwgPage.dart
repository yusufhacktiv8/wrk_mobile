
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/models/SmwgItem.dart';
import 'package:dashboard/pages/smwg/SmwgPageItem.dart';
import 'package:month_picker_strip/month_picker_strip.dart';

class SmwgPage extends StatefulWidget {
  final String title;
  final int year, month, smwgType;
  SmwgPage({Key key, this.title, this.year, this.month, this.smwgType}) : super(key: key);

  @override
  _SmwgPageState createState() => new _SmwgPageState();
}

class _SmwgPageState extends State<SmwgPage> {
  List<SmwgItem> smwgItems = [];
  DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = new DateTime(widget.year, widget.month);
    _getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(
      title: new Text(widget.title),
      centerTitle: true,
    ),
    body: Column(
      children: <Widget>[
        new MonthStrip(
          format: 'MMM yyyy',
          from: new DateTime(2016, 4),
          to: new DateTime(2018, 5),
          initialMonth: _selectedMonth,
          height: 58.0,
          viewportFraction: 0.45,
          onMonthChanged: (v) {
            setState(() {
              _selectedMonth = v;
              _getProjects();
            });
          },
          normalTextStyle: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
          selectedTextStyle: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
        ),
        new Expanded(
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) =>
                Column(
                  children: <Widget>[
                    SmwgPageItem(smwgItem: smwgItems[index]),
                    Divider(height: 1.0, color: Colors.grey,),
                  ],
                )
            ,
            itemCount: smwgItems.length,
          )
        )

      ],
    ));
  }

  _getProjects() async {
    if (!mounted) return;

    await this.getFromApi(_selectedMonth.month, _selectedMonth.year, widget.smwgType);
    setState(() {
    });
  }

  Future<void> getFromApi(int month, int year, int smwgType) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/smwgitems/bysmwg?'
          'year=$year&month=$month&smwgType=$smwgType'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        this.smwgItems = SmwgItem.fromJsonArray(json);
      }
      else{
        this.smwgItems = [];
      }
    } catch (exception) {
      this.smwgItems = [];
    }
  }

}