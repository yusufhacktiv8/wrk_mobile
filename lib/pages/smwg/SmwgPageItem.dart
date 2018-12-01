import 'package:flutter/material.dart';
import 'package:dashboard/models/SmwgItem.dart';
import 'package:intl/intl.dart';

class SmwgPageItem extends StatelessWidget {
  final fn = new NumberFormat("#,###.00");
  final SmwgItem smwgItem;

  SmwgPageItem({Key key, this.smwgItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String bobotText = smwgItem.bobot != null ? fn.format((smwgItem.bobot as num).toDouble()) : "-";
    String nilaiText = smwgItem.nilai != null ? fn.format((smwgItem.nilai as num).toDouble()) : "-";
    if (smwgItem.itemType == 1) {
      return Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Text(smwgItem.name, style: TextStyle(fontSize: 18.0),),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 75.0,
                child: Text(bobotText, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.end,),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 75.0,
                child: Text(nilaiText, style: TextStyle(fontSize: 18.0), textAlign: TextAlign.end,),
              ),
            ],
          ));
    } else if (smwgItem.itemType == 2) {
      return Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.blueAccent,
                  padding: EdgeInsets.all(10.0),
                  child: Text(smwgItem.name, style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.w700, color: Colors.white),),
                ),
              ),
            ],
          ));
    } else {
      return Container(
          padding: EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Expanded(
                child: Container(
                  color: Colors.grey,
                  padding: EdgeInsets.all(10.0),
                  child: Text(smwgItem.name, style: TextStyle(fontSize: 18.0),),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 75.0,
                child: Text(bobotText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700), textAlign: TextAlign.end,),
              ),
              Container(
                padding: EdgeInsets.all(10.0),
                width: 75.0,
                child: Text(nilaiText, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700), textAlign: TextAlign.end,),
              ),
            ],
          ));
    }
  }
}
