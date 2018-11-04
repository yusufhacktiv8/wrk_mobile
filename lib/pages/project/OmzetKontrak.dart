import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';
import 'package:intl/intl.dart';

class OmzetKontrak extends StatelessWidget {

  final Project project;
  final f = new DateFormat('dd/MM/yyyy');

  OmzetKontrak({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text("Omzet Kontrak", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("OK ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(project != null ? project.omzetKontrak.toString() : "-", style: TextStyle(fontSize: 18.0)),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Mulai ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project != null && project.startDate != null ?  f.format(project.startDate) : "-", style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Selesai ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project != null && project.endDate != null ?  f.format(project.endDate) : "-", style: TextStyle(fontSize: 18.0)),
                  ],
                )
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