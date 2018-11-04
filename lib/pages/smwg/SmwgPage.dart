
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
  final DateTime selectedDateTime;
  final int smwgType;
  SmwgPage({Key key, this.title, this.selectedDateTime, this.smwgType}) : super(key: key);

  @override
  _SmwgPageState createState() => new _SmwgPageState();
}

class _SmwgPageState extends State<SmwgPage> {
  List<SmwgItem> smwgItems = [];
  DateTime _selectedDateTime;

  @override
  void initState() {
    super.initState();
    _selectedDateTime = widget.selectedDateTime;
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
        Container(
          child: Row (
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Material(
                  color: Colors.amber,
                  child: Container(
                      padding: EdgeInsets.all(10.0),
                      child: Text("Uraian",
                          style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 19.0))
                  ),
                ),),
              Material(
                color: Colors.blue,
                child: Container(
                  width: 75.0,
                    padding: EdgeInsets.all(10.0),
                    child: Text("Bobot",
                        style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 19.0))
                ),
              ),
              Material(
                color: Colors.teal,
                child: Container(
                    width: 75.0,
                    padding: EdgeInsets.all(10.0),
                    child: Center(
                        child: Text("Nilai",
                            style: TextStyle(color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 19.0))
                    )
                ),
              ),
            ],
          ),
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

    await this.getFromApi(_selectedDateTime.month, _selectedDateTime.year, widget.smwgType);
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