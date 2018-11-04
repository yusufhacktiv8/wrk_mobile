import 'package:flutter/material.dart';
import 'package:dashboard/models/ProjectProgress.dart';
import 'package:dashboard/pages/project/ProjectDetailsPage.dart';

class ProjectItem extends StatelessWidget {
  final ProjectProgress projectProgress;

  final DateTime selectedDateTime;
  ProjectItem({Key key, this.projectProgress, this.selectedDateTime}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ProjectDetailsPage(
                selectedDateTime: selectedDateTime,
                projectId: projectProgress.project.id
            )),
          );
        },
        title: Container(padding: EdgeInsets.only(top: 8.0),
          child: Text(projectProgress.project.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),),
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
                    Text("Rencana",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.ra.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Deviasi",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text((projectProgress.ra - projectProgress.ri).toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("BAD",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.bad.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Ra Progress",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.raProgress.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Piutang Usaha",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.piutangUsaha.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Tagihan Bruto",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.tagihanBruto.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
            Padding(
              padding: EdgeInsets.all(4.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("Cashflow",
                        style: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.bold)),
                    Text(projectProgress.cashflow.toString(),
                        style: TextStyle(fontSize: 17.0))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
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
