import 'package:flutter/material.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:dashboard/pages/project/ProjectDetailsPage.dart';

class ProjectItem extends StatelessWidget {
  final ProjectProgress projectProgress;

  ProjectItem({Key key, this.projectProgress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProjectDetailsPage(
                year: 2018,
                month: 1,
                projectId: projectProgress.project.id
            )),
          );
        },
        title: Text(projectProgress.project.name,
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
                    Text(projectProgress.ra.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Realisasi",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.ri.toString(),
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
                    Text((projectProgress.ra - projectProgress.ri).toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("PDP",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.pdp.toString(),
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
                    Text(projectProgress.bad.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("OK",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.ok.toString(),
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
                    Text(projectProgress.raProgress.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Ri Progress",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.riProgress.toString(),
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
                    Text(projectProgress.piutangUsaha.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Piutang Retensi",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.piutangRetensi.toString(),
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
                    Text(projectProgress.tagihanBruto.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Persediaan",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.persediaan.toString(),
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
                    Text(projectProgress.cashflow.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text("Laba Kotor",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.labaKotor.toString(),
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
