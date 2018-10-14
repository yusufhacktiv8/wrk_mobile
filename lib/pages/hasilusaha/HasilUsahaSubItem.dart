import 'package:flutter/material.dart';
import 'package:dashboard/models/Project.dart';
import 'package:intl/intl.dart';

class HasilUsahaSubItem extends StatelessWidget {

  Map<String, dynamic> data;
  final f = new DateFormat('dd/MM/yyyy');
  final fn = new NumberFormat("#,###.00");

  HasilUsahaSubItem({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    dynamic rkapExternLalu = data != null && data["extern"]["rkap"] != null? data["extern"]["rkap"] : null;
    String rkapExternLaluText = "-";
    if (rkapExternLalu != null) {
      rkapExternLaluText = fn.format((rkapExternLalu as num).toDouble());
    }

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
                        Text(rkapExternLaluText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Ri s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("JO", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Ri s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        Card(
          child: ListTile(
            title: Text("Intern", style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold)),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text("Ri s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text("0.0", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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