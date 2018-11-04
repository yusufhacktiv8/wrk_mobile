import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';
import 'package:dashboard/pages/smwg/SmwgPage.dart';
import 'package:intl/intl.dart';

class Qmsl extends StatelessWidget {
  final Project project;
  final f = new DateFormat('dd/MM/yyyy');
  final DateTime selectedDateTime;
  final detailsPageContext;

  Qmsl({Key key, this.project, this.selectedDateTime, this.detailsPageContext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FlatButton(
            textColor: Colors.blue,
            child: Text("QMSL", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                detailsPageContext,
                MaterialPageRoute(builder: (context) => SmwgPage(
                  title: "QMSL",
                  selectedDateTime: selectedDateTime,
                    smwgType: 1,
                )),
              );
            },
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text("SHE Level", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                detailsPageContext,
                MaterialPageRoute(builder: (context) => SmwgPage(
                  title: "SHE Level",
                  selectedDateTime: selectedDateTime,
                  smwgType: 2,
                )),
              );
            },
          ),
          FlatButton(
            textColor: Colors.blue,
            child: Text("5R", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
            onPressed: () {
              Navigator.push(
                detailsPageContext,
                MaterialPageRoute(builder: (context) => SmwgPage(
                  title: "5R",
                  selectedDateTime: selectedDateTime,
                  smwgType: 3,
                )),
              );
            },
          )
        ],
      ),
    );
  }
}
