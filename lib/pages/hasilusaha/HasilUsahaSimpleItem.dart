import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HasilUsahaSimpleItem extends StatelessWidget {
  final String title;
  final String dataRoot;
  Map<String, dynamic> data;
  final fn = new NumberFormat("#,###.00");

  HasilUsahaSimpleItem({Key key, this.title, this.data, this.dataRoot}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    dynamic rkap = data != null && data[dataRoot]["rkap"] != null? data[dataRoot]["rkap"] : null;
    dynamic ra = data != null && data[dataRoot]["ra"] != null? data[dataRoot]["ra"] : null;
    dynamic ri = data != null && data[dataRoot]["ri"] != null? data[dataRoot]["ri"] : null;
    dynamic prognosa = data != null && data[dataRoot]["prognosa"] != null? data[dataRoot]["prognosa"] : null;

    String rkapText = rkap != null ? fn.format((rkap as num).toDouble()) : "-";
    String raText = ra != null ? fn.format((ra as num).toDouble()) : "-";
    String riText = ri != null ? fn.format((ri as num).toDouble()) : "-";
    String prognosaText = prognosa != null ? fn.format((prognosa as num).toDouble()) : "-";

    return Container(
      padding: EdgeInsets.all(10.0),
      child: ListView(children: <Widget>[
        Card(
            child: Container(
                padding: EdgeInsets.all(8.0),
                height: 120.0,
                child: ListTile(
                  subtitle: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("RKAP ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                              Text(rkapText, style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("Ra s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                              Text(raText, style: TextStyle(fontSize: 18.0)),
                            ],
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Ri s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                              Text(riText, style: TextStyle(fontSize: 18.0)),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                              Text(prognosaText, style: TextStyle(fontSize: 18.0)),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                )
            )
          )
      ],),
    );
  }
}

