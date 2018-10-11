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
            )
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
        ));
  }
}
