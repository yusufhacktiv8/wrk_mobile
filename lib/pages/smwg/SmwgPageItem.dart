import 'package:flutter/material.dart';
import 'package:dashboard/models/SmwgItem.dart';

class SmwgPageItem extends StatelessWidget {
  final SmwgItem smwgItem;

  SmwgPageItem({Key key, this.smwgItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(smwgItem.name,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        subtitle: Row(
          children: <Widget>[
            Text(smwgItem.bobot.toString()),
            Text(" - "),
            Text(smwgItem.nilai.toString()),
          ],
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16.0,
        ));
  }
}
