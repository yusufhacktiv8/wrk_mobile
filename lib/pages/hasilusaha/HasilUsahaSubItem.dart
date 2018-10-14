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

    dynamic rkapExtern = data != null && data["extern"]["rkap"] != null? data["extern"]["rkap"] : null;
    dynamic raExtern = data != null && data["extern"]["ra"] != null? data["extern"]["ra"] : null;
    dynamic riExtern = data != null && data["extern"]["ri"] != null? data["extern"]["ri"] : null;
    dynamic prognosaExtern = data != null && data["extern"]["prognosa"] != null? data["extern"]["prognosa"] : null;

    String rkapExternText = rkapExtern != null ? fn.format((rkapExtern as num).toDouble()) : "-";
    String raExternText = raExtern != null ? fn.format((raExtern as num).toDouble()) : "-";
    String riExternText = riExtern != null ? fn.format((riExtern as num).toDouble()) : "-";
    String prognosaExternText = prognosaExtern != null ? fn.format((prognosaExtern as num).toDouble()) : "-";


    dynamic rkapJO = data != null && data["jo"]["rkap"] != null? data["jo"]["rkap"] : null;
    dynamic raJO = data != null && data["jo"]["ra"] != null? data["jo"]["ra"] : null;
    dynamic riJO = data != null && data["jo"]["ri"] != null? data["jo"]["ri"] : null;
    dynamic prognosaJO = data != null && data["jo"]["prognosa"] != null? data["jo"]["prognosa"] : null;

    String rkapJOText = rkapJO != null ? fn.format((rkapJO as num).toDouble()) : "-";
    String raJOText = raJO != null ? fn.format((raJO as num).toDouble()) : "-";
    String riJOText = riJO != null ? fn.format((riJO as num).toDouble()) : "-";
    String prognosaJOText = prognosaJO != null ? fn.format((prognosaJO as num).toDouble()) : "-";

    dynamic rkapIntern = data != null && data["intern"]["rkap"] != null? data["intern"]["rkap"] : null;
    dynamic raIntern = data != null && data["intern"]["ra"] != null? data["intern"]["ra"] : null;
    dynamic riIntern = data != null && data["intern"]["ri"] != null? data["intern"]["ri"] : null;
    dynamic prognosaIntern = data != null && data["intern"]["prognosa"] != null? data["intern"]["prognosa"] : null;

    String rkapInternText = rkapIntern != null ? fn.format((rkapIntern as num).toDouble()) : "-";
    String raInternText = raIntern != null ? fn.format((raIntern as num).toDouble()) : "-";
    String riInternText = riIntern != null ? fn.format((riIntern as num).toDouble()) : "-";
    String prognosaInternText = prognosaIntern != null ? fn.format((prognosaIntern as num).toDouble()) : "-";

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
                        Text(rkapExternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Ra s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(raExternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                        Text(riExternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(prognosaExternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                        Text(rkapJOText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Ra s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(raJOText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                        Text(riJOText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(prognosaJOText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                        Text(rkapInternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Ra s/d Saat Ini ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(raInternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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
                        Text(riInternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text("Prognosa ", style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                        Text(prognosaInternText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
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