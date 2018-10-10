
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/states/Project.dart';

class ProjectPage extends StatefulWidget {
  ProjectPage({Key key}) : super(key: key);

  @override
  _ProjectPageState createState() => new _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<Project> projects = [];

  @override
  void initState() {
    super.initState();
    _getProjects(2018, 1);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(appBar: new AppBar(
      title: new Text('Dashboard'),
      centerTitle: true,
    ),
    body:ListView.builder(
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
    ));
  }

  _getProjects(int year, int month) async {
    if (!mounted) return;

    await this.getFromApi(month, year);
    setState(() {
    });
  }

  Future<void> getFromApi(int month, int year) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/projectprogresses/bymonthyear?year=$year&month=$month'));
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