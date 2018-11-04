import 'package:flutter/material.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:intl/intl.dart';

class PiutangRetensi extends StatelessWidget {

  final ProjectProgress projectProgress;
  final fn = new NumberFormat("#,###.00");

  PiutangRetensi({Key key, this.projectProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
//        title: Text("Progress", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Piutang Retensi ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress != null ?  fn.format(projectProgress.piutangRetensi) : "-", style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Tagihan Bruto ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress != null ?  fn.format(projectProgress.tagihanBruto) : "-", style: TextStyle(fontSize: 18.0)),
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