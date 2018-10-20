import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/events.dart';
import 'package:dashboard/models/ProjectCount.dart';

class ProjectCountTile extends StatefulWidget {
  final int projectType;

  ProjectCountTile({Key key, this.projectType}) : super(key: key);

  @override
  _ProjectCountTileState createState() => _ProjectCountTileState();
}

class _ProjectCountTileState extends State<ProjectCountTile> {
  final fn = new NumberFormat("#,###");
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
        future: _getFromApi(widget.projectType),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data.count != null) {
              return Text(fn.format(snapshot.data.count), style: TextStyle(color: Colors.black87, fontSize: 21.0, fontWeight: FontWeight.bold));
            } else {
              return Text('-', style: TextStyle(color: Colors.black87, fontSize: 21.0, fontWeight: FontWeight.bold));
            }
          } else {
            return new CircularProgressIndicator();
          }
        });
  }

  Future<void> _getFromApi(int projectType) async {
    try {
      var httpClient = new HttpClient();
      var request =
      await httpClient.getUrl(Uri.parse('$URL/projects/countbytype?projectType=$projectType'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        return ProjectCount.fromJson(json);
      } else {
        return ProjectCount();
      }
    } catch (exception) {
      return ProjectCount();
    }
  }
}
