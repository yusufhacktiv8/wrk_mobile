import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';
import 'package:intl/intl.dart';

class TimProyek extends StatelessWidget {

  final Project project;
  final f = new DateFormat('dd/MM/yyyy');

  TimProyek({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Tim Proyek", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Manager ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(project != null && project.mp != null ? project.mp : "-", style: TextStyle(fontSize: 18.0)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Kasie Keu ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(project != null && project.keu != null ?  project.keu : "-", style: TextStyle(fontSize: 18.0)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("Kasie Kom ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(project != null && project.kom != null ?  project.kom : "-", style: TextStyle(fontSize: 18.0,)),
                    ],
                  )
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Pelut ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(project != null && project.pelut != null ?  project.pelut : "-", style: TextStyle(fontSize: 18.0)),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("Kasie Enjineering ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      Text(project != null && project.eng != null ?  project.eng : "-", style: TextStyle(fontSize: 18.0)),
                    ],
                  ),),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
          ],
        ),
      ),
    );
  }
}