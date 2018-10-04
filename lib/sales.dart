import 'dart:io';
import 'dart:async';

import 'dart:convert';
import 'package:dashboard/Constant.dart';

class Sales {
  final int month;
  final double plan;
  final double actual;

  Sales({
    this.month,
    this.plan,
    this.actual
  });

  static List<Sales> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Sales> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Sales(
          month: data[i]["month"],
          plan: double.parse(data[i]["plan"].toString()),
          actual: double.parse(data[i]["actual"].toString())
      ));
//      print(data[i]["month"]);
    }
    return result;
  }
}

class SalesState{
  List<Sales> posts;
  bool loading;
  bool error;

  SalesState({
    this.posts = const [],
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.posts = [];
    this.loading = true;
    this.error = false;
  }

  Future<void> getFromApi(int year) async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('$URL/sales?year=$year'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.posts = Sales.fromJsonArray(json);
        this.loading = false;
        this.error = false;
      }
      else{
        this.posts = [];
        this.loading = false;
        this.error = true;
      }
    } catch (exception) {
      this.posts = [];
      this.loading = false;
      this.error = true;
    }
  }
}