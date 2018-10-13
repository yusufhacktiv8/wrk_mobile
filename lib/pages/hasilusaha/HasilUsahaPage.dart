
import 'package:flutter/cupertino.dart';

class HasilUsahaPage extends StatefulWidget {
  final int year, month, projectType;
  HasilUsahaPage({Key key, this.year, this.month, this.projectType}) : super(key: key);

  @override
  _HasilUsahaPageState createState() => new _HasilUsahaPageState();
}

class _HasilUsahaPageState extends State<HasilUsahaPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar:  CupertinoNavigationBar(),
      child: Container(
        child: Text("Hello"),
      )
    );
  }

}