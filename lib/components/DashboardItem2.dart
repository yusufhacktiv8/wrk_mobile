import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/states/ProjectCount.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/Constant.dart';
import 'package:flutter/foundation.dart';

const TITLE = 'Proyek Kons & Fab';

class DashboardItem2 extends StatefulWidget {
  final int projectType;
  DashboardItem2({Key key, @required this.projectType}) : super(key: key);

  @override
  _DashboardItemState2 createState() => new _DashboardItemState2();
}

class _DashboardItemState2 extends State<DashboardItem2> {
  final ProjectState projectState = new ProjectState();
  ProjectCount projectCount = new ProjectCount(count: 0);
  BuildContext context;

  @override
  void initState() {
    super.initState();
    _getProjectCount(widget.projectType);
  }

  _getProjectCount(int projectType) async {
    if (!mounted) return;

    await _getFromApi(projectType);
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(TITLE, style: TextStyle(fontSize: 17.0)),
      subtitle: Text(projectCount.count != null ? projectCount.count.toString() : '0', style: TextStyle(fontSize: 25.0)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),
      onTap: () => Navigator.pushNamed(context, '/projects'),

    );
  }

  Future<void> _getFromApi(int projectType) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/projectprogresses/countbytype?projectType=$projectType'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.projectCount = ProjectCount.fromJsonArray(json);
      }
      else{
        this.projectCount = new ProjectCount(count: 0);
      }
    } catch (exception) {
      this.projectCount = new ProjectCount(count: 0);
    }
  }
}
