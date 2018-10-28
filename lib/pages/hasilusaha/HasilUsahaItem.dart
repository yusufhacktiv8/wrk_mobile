import 'package:flutter/material.dart';
import 'package:dashboard/pages/hasilusaha/HasilUsahaSubItem.dart';
import 'package:dashboard/models/Project.dart';

class HasilUsahaItem extends StatefulWidget {
  final String title;
  final String dataRoot;
  Map<String, dynamic> data;

  HasilUsahaItem({Key key, this.title, this.data, this.dataRoot}) : super(key: key);

  HasilUsahaItemState createState() => new HasilUsahaItemState();
}

class HasilUsahaItemState extends State<HasilUsahaItem> {
  
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10.0),
          child: Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.teal,
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Pesanan Tahun Lalu",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.0))
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  HasilUsahaSubItem(),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Row(
                    children: <Widget>[
                      Material(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.amber,
                        child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Text("Pesanan Baru",
                                style: TextStyle(color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 19.0))
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  HasilUsahaSubItem(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
