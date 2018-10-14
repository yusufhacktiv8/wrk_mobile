import 'package:flutter/material.dart';
import 'package:dashboard/pages/hasilusaha/HasilUsahaSubItem.dart';
import 'package:dashboard/models/Project.dart';

class HasilUsahaItem extends StatefulWidget {
  HasilUsahaItemState createState() => new HasilUsahaItemState();
}

class NewItem {
  bool isExpanded;
  final String header;
  final Widget body;
  final Icon iconpic;
  NewItem(this.isExpanded, this.header, this.body, this.iconpic);

  getBody() {
    return Padding(
        padding: new EdgeInsets.all(20.0),
        child: new Column(
            children: <Widget>[
              Container(
                height: 100.0,
                child: HasilUsahaSubItem(project: Project()),
              )

            ])
    );
  }
}

double discretevalue = 2.0;
double hospitaldiscretevalue = 25.0;

class HasilUsahaItemState extends State<HasilUsahaItem> {
  List<NewItem> items = <NewItem>[
    new NewItem(
        true,
        'Pesanan Tahun Lalu',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
                children: <Widget>[
                  Text("Hello")

                ])
        ), Icon(Icons.album)),
    new NewItem(
        true,
        'Pesanan Baru',
        new Padding(
            padding: new EdgeInsets.all(20.0),
            child: new Column(
                children: <Widget>[
                  Text("Hello")
                ])
        ), Icon(Icons.album)),
    //give all your items here
  ];

  ListView List_Criteria;
  Widget build(BuildContext context) {
    List_Criteria = new ListView(
      children: [
        Padding(
          padding: new EdgeInsets.all(10.0),
          child: Text("Kontrak Dihadapi", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        ),
        new Padding(
          padding: new EdgeInsets.all(10.0),
          child: new ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                items[index].isExpanded = !items[index].isExpanded;
              });
            },
            children: items.map((NewItem item) {
              return new ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return new ListTile(
                      leading: item.iconpic,
                      title: new Text(
                        item.header,
                        textAlign: TextAlign.left,
                        style: new TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ));
                },
                isExpanded: item.isExpanded,
                body: item.getBody(),
              );
            }).toList(),
          ),
        )
      ],
    );

    return List_Criteria;
  }
}