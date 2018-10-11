
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/states/Project.dart';
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
    _getProjects(widget.year, widget.month, widget.projectType);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(
      title: new Text('Dashboard'),
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
                    ListTile(
                        title: Text(projects[index].name, style: TextStyle(fontSize: 17.0)),
                        trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,)
                    ),
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

  _getProjects(int year, int month, int projectType) async {
    if (!mounted) return;

    await this.getFromApi(month, year, projectType);
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