import 'package:flutter/material.dart';
import 'package:dashboard/pages/hasilusaha/HasilUsahaSubItem.dart';
import 'package:dashboard/models/Project.dart';

class HasilUsahaItem extends StatefulWidget {
  final String title;
  Map<String, dynamic> data;

  HasilUsahaItem({Key key, this.title, this.data}) : super(key: key);

  HasilUsahaItemState createState() => new HasilUsahaItemState();
}

class NewItem {
  bool isExpanded;

  NewItem(this.isExpanded);

}

class HasilUsahaItemState extends State<HasilUsahaItem> {

  List<NewItem> items = <NewItem>[
    new NewItem(true),
    new NewItem(true),
    //give all your items here
  ];

  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: new EdgeInsets.all(10.0),
          child: Text(widget.title,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: <ExpansionPanel>[
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
//                      leading: item.iconpic,
                      title: new Text(
                    'Pesanan Tahun Lalux',
                    textAlign: TextAlign.left,
                    style: new TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ));
                },
                isExpanded: items[0].isExpanded,
                body: Padding(
                    padding: new EdgeInsets.all(20.0),
                    child: new Column(children: <Widget>[
                      Container(
                        height: 200.0,
                        child: HasilUsahaSubItem(project: Project()),
                      )
                    ])),
              ),
              ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
//                      leading: item.iconpic,
                      title: new Text(
                        'Pesanan Baru',
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                },
                isExpanded: items[1].isExpanded,
                body: Padding(
                    padding: new EdgeInsets.all(20.0),
                    child: new Column(children: <Widget>[
                      Container(
                        height: 200.0,
                        child: HasilUsahaSubItem(project: Project()),
                      )
                    ])),
              )
            ],
          ),
        )
      ],
    );
  }
}
