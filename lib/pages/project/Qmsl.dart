import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';
import 'package:intl/intl.dart';

class Qmsl extends StatelessWidget {
  final Project project;
  final f = new DateFormat('dd/MM/yyyy');

  Qmsl({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            textColor: const Color(0xFF35567D),
            child: Text("QMSL"),
            onPressed: () {

            },
          ),
          FlatButton(
            textColor: const Color(0xFF35567D),
            child: Text("SHE Level"),
            onPressed: () {

            },
          ),
          FlatButton(
            textColor: const Color(0xFF35567D),
            child: Text("5R"),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}
