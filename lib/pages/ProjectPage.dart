
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/states/Project.dart';
import 'package:dashboard/pages/ProjectItem.dart';
import 'package:month_picker_strip/month_picker_strip.dart';

class ProjectPage extends StatefulWidget {
  final int year, month, projectType;
  ProjectPage({Key key, this.year, this.month, this.projectType}) : super(key: key);

  @override
  _ProjectPageState createState() => new _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project> projects = [];
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
      title: new Text('Project'),
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
                    ProjectItem(project: projects[index]),
                    Divider(height: 1.0, color: Colors.grey,),
                  ],
                )
            ,
            itemCount: projects.length,
          )
        )

      ],
    ));
  }

  _getProjects() async {
    if (!mounted) return;

    await this.getFromApi(_selectedMonth.month, _selectedMonth.year, widget.projectType);
    setState(() {
    });
  }

  Future<void> getFromApi(int month, int year, int projectType) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/projectprogresses/bymonthyear?'
          'year=$year&month=$month&projectType=$projectType'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.projects = Project.fromJsonArray(json);
      }
      else{
        this.projects = [];
      }
    } catch (exception) {
      this.projects = [];
    }
  }

}