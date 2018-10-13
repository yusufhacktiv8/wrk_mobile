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
            Row(
              children: <Widget>[
                Text("OK ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(project != null ? project.omzetKontrak.toString() : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
            Row(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Mulai ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project != null && project.startDate != null ?  f.format(project.startDate) : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Selesai ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project != null && project.endDate != null ?  f.format(project.endDate) : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}