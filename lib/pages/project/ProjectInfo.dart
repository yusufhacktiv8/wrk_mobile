import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';

class ProjectInfo extends StatelessWidget {

  final Project project;

  ProjectInfo({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Info Proyek", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Text(project != null ? project.name : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Text(project != null && project.address != null? project.address : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Text(project != null && project.givenBy != null? project.givenBy : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}