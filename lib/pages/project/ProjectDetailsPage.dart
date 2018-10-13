
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:month_picker_strip/month_picker_strip.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:dashboard/models/Project.dart';
import 'package:dashboard/pages/project/ProjectInfo.dart';
import 'package:dashboard/pages/project/OmzetKontrak.dart';
import 'package:dashboard/pages/project/TimProyek.dart';
import 'package:dashboard/pages/project/Progress.dart';
import 'package:dashboard/pages/project/PiutangRetensi.dart';
import 'package:dashboard/pages/project/PiutangUsaha.dart';
import 'package:dashboard/pages/project/Persediaan.dart';


class ProjectDetailsPage extends StatefulWidget {
  final int year, month, projectId;
  ProjectDetailsPage({Key key, this.year, this.month, this.projectId}) : super(key: key);

  @override
  _ProjectDetailsPageState createState() => new _ProjectDetailsPageState();
}

class _ProjectDetailsPageState extends State<ProjectDetailsPage> {
  Project project;
  ProjectProgress projectProgress;
  DateTime _selectedMonth;

  @override
  void initState() {
    super.initState();
    _selectedMonth = new DateTime(widget.year, widget.month);
    _getProjectProgress();
    _getProject();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(
      title: new Text('Project Details'),
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
                  _getProjectProgress();
                });
              },
              normalTextStyle: TextStyle(fontSize: 16.0, color: Colors.blueGrey),
              selectedTextStyle: TextStyle(fontSize: 20.0, color: Colors.blueAccent),
            ),
            new Expanded(
                child: ListView(
                  children: <Widget>[
                    ProjectInfo(project: project),
                    OmzetKontrak(project: project),
                    TimProyek(project: project),
                    Progress(projectProgress: projectProgress),
                    PiutangRetensi(projectProgress: projectProgress),
                    PiutangUsaha(projectProgress: projectProgress),
                    Persediaan(projectProgress: projectProgress),
                  ],
                )
            )

          ],
        ));
  }

  _getProjectProgress() async {
    if (!mounted) return;

    await this.getProjectProgressFromApi(_selectedMonth.month, _selectedMonth.year, widget.projectId);
    setState(() {
    });
  }

  _getProject() async {
    if (!mounted) return;

    await this.getProjectFromApi(widget.projectId);
    setState(() {
    });
  }

  Future<void> getProjectProgressFromApi(int month, int year, int projectId) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/projectprogresses/byproject?'
          'year=$year&month=$month&projectId=$projectId'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.projectProgress = ProjectProgress.fromJson(json);
      }
      else{
        this.projectProgress = null;
      }
    } catch (exception) {
      this.projectProgress = null;
    }
  }

  Future<void> getProjectFromApi(int projectId) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/projects/byid/$projectId'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.project = Project.fromJson(json);
      }
      else{
        this.project = null;
      }
    } catch (exception) {
      this.project = null;
    }
  }

}