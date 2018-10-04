import 'dart:io';
import 'dart:async';

import 'dart:convert';
import 'package:dashboard/Constant.dart';

class Credit {
  final int month;
  final double pu;
  final double tb;

  Credit({
    this.month,
    this.pu,
    this.tb
  });

  static List<Credit> fromJsonArray(String jsonArrayString){
    List data = json.decode(jsonArrayString);
    List<Credit> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Credit(
          month: data[i]["month"],
          pu: double.parse(data[i]["pu"].toString()),
          tb: double.parse(data[i]["tb"].toString())
      ));
//      print(data[i]["month"]);
    }
    return result;
  }
}

class CreditState{
  List<Credit> posts;
  bool loading;
  bool error;

  CreditState({
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
      var request = await httpClient.getUrl(Uri.parse('$URL/creditsbyyear?year=$year'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.posts = Credit.fromJsonArray(json);
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