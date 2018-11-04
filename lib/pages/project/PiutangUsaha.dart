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
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Piutang Usaha ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black54)),
                Text(projectProgress != null ?  fn.format(projectProgress.piutangUsaha) : "-", style: TextStyle(fontSize: 18.0)),
              ],
            ),
          ],
        ),
      ), 
    );
  }
}