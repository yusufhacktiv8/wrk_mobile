import 'package:flutter/material.dart';
import 'package:dashboard/charts/MainCharts.dart';
import 'package:dashboard/components/DashboardItem.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Dashboard'),
          centerTitle: true,
        ),
        body: new ListView(children: <Widget>[
          new MainCharts(),
          DashboardItem(),
          Divider(height: 1.0, color: Colors.grey,),
          ListTile(
            title: Text("Proyek Kons & Fab", style: TextStyle(fontSize: 17.0)),
            subtitle: Text("4.30", style: TextStyle(fontSize: 25.0)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),
          ),
          Divider(height: 1.0, color: Colors.grey,),
          ListTile(
            title: Text("Proyek O & M", style: TextStyle(fontSize: 17.0)),
            subtitle: Text("4.30", style: TextStyle(fontSize: 25.0)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),
          ),
          Divider(height: 1.0, color: Colors.grey,),
          ListTile(
            title: Text("Score Card", style: TextStyle(fontSize: 17.0)),
            subtitle: Text("4.30", style: TextStyle(fontSize: 25.0)),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16.0,),
          )
        ],));
  }
}
