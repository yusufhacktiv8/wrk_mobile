import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';
import 'package:intl/intl.dart';

class HasilUsahaSubItem extends StatelessWidget {

  final Project project;
  final f = new DateFormat('dd/MM/yyyy');

  HasilUsahaSubItem({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView(
      children: <Widget>[
        Card(
          child: ListTile(
            title: Text("Extern", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
            subtitle: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("RKAP ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Ra s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}