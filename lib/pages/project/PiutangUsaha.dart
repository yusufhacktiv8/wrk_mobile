import 'package:flutter/material.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:intl/intl.dart';

class PiutangUsaha extends StatelessWidget {

  final ProjectProgress projectProgress;
  final fn = new NumberFormat("#,###.00");

  PiutangUsaha({Key key, this.projectProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        title: Text("Omzet Kontrak", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("Piutang Usaha ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(projectProgress != null ?  fn.format(projectProgress.piutangUsaha) : "-", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}