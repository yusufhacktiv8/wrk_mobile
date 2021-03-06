import 'package:flutter/material.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:intl/intl.dart';

class Persediaan extends StatelessWidget {

  final ProjectProgress projectProgress;
  final fn = new NumberFormat("#,###.00");

  Persediaan({Key key, this.projectProgress}) : super(key: key);

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
                    Text("Persediaan ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress != null ?  fn.format(projectProgress.persediaan) : "-", style: TextStyle(fontSize: 18.0)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text("Cashflow ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress != null ?  fn.format(projectProgress.cashflow) : "-", style: TextStyle(fontSize: 18.0)),
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