
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:dashboard/pages/project/ProjectItem.dart';
import 'package:dashboard/pages/dashboard/MonthSelector.dart';

class ProjectPage extends StatefulWidget {
  final DateTime selectedDateTime;
  final int projectType;
  ProjectPage({Key key, this.selectedDateTime, this.projectType}) : super(key: key);

  @override
  _ProjectPageState createState() => new _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
  List<ProjectProgress> projects = [];
  DateTime _selectedDateTime;
  String _title = "";

  @override
  void initState() {
    super.initState();
    _title = widget.projectType == 1 ? 'Kons & Fab' : 'O & M';
    _selectedDateTime = widget.selectedDateTime;
    _getProjects();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(this._title),
          centerTitle: true,
          leading: IconButton(
            tooltip: 'Previous page',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(20.0),
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
              ],
            ),
          ),
        ),
        body: FutureBuilder(
            future: _getProjects(),
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
                    return ListView.builder(
                      itemBuilder: (BuildContext context, int index) =>
                          Column(
                            children: <Widget>[
                              ProjectItem(projectProgress: data[index]),
                              Divider(height: 1.0, color: Colors.grey,),
                            ],
                          )
                      ,
                      itemCount: data.length,
                    );
              }
            }),
      ),
    );
  }

  _getProjects() async {
    if (!mounted) return;

    return await this.getFromApi(_selectedDateTime.month, _selectedDateTime.year, widget.projectType);
  }

  Future<void> getFromApi(int month, int year, int projectType) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/projectprogresses/bymonthyear?'
          'year=$year&month=$month&projectType=$projectType'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var json = await response.transform(utf8.decoder).join();
        return ProjectProgress.fromJsonArray(json);
      }
      else{
        return [];
      }
    } catch (exception) {
      return [];
    }
  }

}