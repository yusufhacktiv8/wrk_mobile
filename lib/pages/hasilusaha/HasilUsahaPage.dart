import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:dashboard/Constant.dart';
import 'package:dashboard/pages/dashboard/MonthSelector.dart';
import 'package:dashboard/DotsIndicator.dart';
import 'package:dashboard/pages/hasilusaha/HasilUsahaItem.dart';
import 'package:dashboard/pages/hasilusaha/HasilUsahaSimpleItem.dart';

class HasilUsahaPage extends StatefulWidget {
  final DateTime selectedDateTime, projectType;

  HasilUsahaPage({Key key, this.selectedDateTime, this.projectType})
      : super(key: key);

  @override
  _HasilUsahaPageState createState() => new _HasilUsahaPageState();
}

class _HasilUsahaPageState extends State<HasilUsahaPage> with SingleTickerProviderStateMixin{
  final fn = new NumberFormat("#,###.00");
  DateTime _selectedDateTime;
  Map<String, dynamic> _data;
  TabController _tabController;
  String title = "Kontrak Dihadapi";

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: choices.length);
    _tabController.addListener(() {
      String title = "";
      switch (_tabController.index) {
        case 0:
          title = "Kontrak Dihadapi";
          break;
        case 1:
          title = "Penjualan";
          break;
        case 2:
          title = "Laba Kotor";
          break;
        case 3:
          title = "Biaya Usaha";
          break;
        case 4:
          title = "Bunga";
          break;
        case 5:
          title = "Laba Rugi Lain - lain";
          break;
        default:
          title = "-";

      }
      setState(() {
        this.title = title;
      });
    });
    _selectedDateTime = widget.selectedDateTime;
    _getRevenues();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _nextPage(int delta) {
    final int newIndex = _tabController.index + delta;
    if (newIndex < 0 || newIndex >= _tabController.length) return;
    _tabController.animateTo(newIndex);
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Hasil Usaha'),
          centerTitle: true,
          leading: IconButton(
            tooltip: 'Previous page',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(58.0),
            child: Column(children: <Widget>[
              MonthSelector(parentContext: context, textColor: Colors.white70, selectedDateTime: widget.selectedDateTime,),
              Theme(
                data: Theme.of(context).copyWith(accentColor: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(left: 15.0, bottom: 10.0),
                        child: Text(this.title, style: TextStyle(color: Colors.white, fontSize: 18.0),),
                      ),
                    ),
                    Container(
                      height: 28.0,
                      padding: EdgeInsets.only(right: 20.0, bottom: 5.0),
                      alignment: Alignment.centerRight,
                      child: TabPageSelector(controller: _tabController),
                    ),
                ],),
              ),
            ],),
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            HasilUsahaItem(),
            HasilUsahaItem(),
          ],
        ),
      ),
    );
  }

  _getRevenues() async {
    if (!mounted) return;

    await this.getFromApi(_selectedDateTime.month, _selectedDateTime.year);
    setState(() {
    });
  }

  Future<void> getFromApi(int month, int year) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/revenues/byyearmonth?'
          'year=$year&month=$month'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.ok) {
        var jsonString = await response.transform(utf8.decoder).join();
        Map<String, dynamic> revenueData = json.decode(jsonString);
        _data = json.decode(revenueData["data"]);
      }
      else{
        this._data = null;
      }
    } catch (exception) {
      this._data = null;
    }
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

