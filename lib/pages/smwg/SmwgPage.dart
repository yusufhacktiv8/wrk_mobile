
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/models/SmwgItem.dart';
import 'package:dashboard/pages/smwg/SmwgPageItem.dart';
import 'package:dashboard/pages/dashboard/MonthSelector.dart';

class SmwgPage extends StatefulWidget {
  final String title;
  final String projectName;
  final DateTime selectedDateTime;
  final int smwgType;
  SmwgPage({Key key, this.title, this.projectName, this.selectedDateTime, this.smwgType}) : super(key: key);

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
    _getSmwgs();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
          leading: IconButton(
            tooltip: 'Previous page',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(58.0),
            child: Column(
              children: <Widget>[
                MonthSelector(
                  parentContext: context,
                  textColor: Colors.white70,
                  selectedDateTime: widget.selectedDateTime,
                  onChange: (selectedDateTime) {
                    this.setState(() {
                      this._selectedDateTime = selectedDateTime;
                    });
                  },
                ),
                Container(
                  padding: EdgeInsets.only(left: 8.0, right: 8.0, bottom: 15.0),
                  child: Text(widget.projectName, style:TextStyle(color: Colors.white, fontSize: 19.0)),
                ),
              ],
            ),
          ),
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
              child: FutureBuilder(
                  future: _getSmwgs(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    final data = snapshot.data;
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: new CircularProgressIndicator(),
                        );
                      default:
                        if (snapshot.hasError)
                          return Center(
                            child: new CircularProgressIndicator(),
                          );
                        else
                        if (data.length > 0) {
                          return ListView.builder(
                            itemBuilder: (BuildContext context, int index) =>
                                Column(
                                  children: <Widget>[
                                    SmwgPageItem(smwgItem: data[index]),
                                    Divider(height: 1.0, color: Colors.grey,),
                                  ],
                                )
                            ,
                            itemCount: data.length,
                          );
                        } else {
                          return Center(child: Text("No Data"),);
                        }
                    }
                  })
            ),
          ],
        ),
      ),
    );
  }

  _getSmwgs() async {
    if (!mounted) return;
    return await this.getFromApi(_selectedDateTime.month, _selectedDateTime.year, widget.smwgType);
  }

  Future<void> getFromApi(int month, int year, int smwgType) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/smwgitems/bysmwg?'
          'year=$year&month=$month&smwgType=$smwgType'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        return SmwgItem.fromJsonArray(json);
      }
      else{
        return [];
      }
    } catch (exception) {
      return [];
    }
  }
}