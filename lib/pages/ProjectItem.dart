import 'package:flutter/material.dart';
import 'package:dashboard/states/Project.dart';

class ProjectItem extends StatelessWidget {
  final Project project;

  ProjectItem({Key key, this.project}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(project.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        subtitle: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Rencana",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.ra.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Realisasi",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.ri.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Deviasi",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text((project.ra - project.ri).toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("PDP",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.pdp.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("BAD",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.bad.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("OK",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.ok.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Ra Progress",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.raProgress.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Ri Progress",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.riProgress.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Piutang Usaha",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.piutangUsaha.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Piutang Retensi",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.piutangRetensi.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Tagihan Bruto",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.tagihanBruto.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Persediaan",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.persediaan.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text("Cashflow",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.cashflow.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Laba Kotor",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(project.labaKotor.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
              ],
            )
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
        ));
  }
}
