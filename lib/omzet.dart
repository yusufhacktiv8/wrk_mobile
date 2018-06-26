import 'dart:io';
import 'dart:async';

import 'dart:convert';

class Omzet {
  final int month;
  final double plan;
  final double actual;

  Omzet({
    this.month,
    this.plan,
    this.actual
  });

  static List<Omzet> fromJsonArray(String jsonArrayString){
    List data = JSON.decode(jsonArrayString);
    List<Omzet> result = [];
    for(var i=0; i<data.length; i++){
      result.add(new Omzet(
          month: data[i]["month"],
          plan: data[i]["plan"],
          actual: data[i]["actual"]
      ));
//      print(data[i]["month"]);
    }
    return result;
  }
}

class OmzetState{
  List<Omzet> posts;
  bool loading;
  bool error;

  OmzetState({
    this.posts = const [],
    this.loading = true,
    this.error = false,
  });

  void reset(){
    this.posts = [];
    this.loading = true;
    this.error = false;
  }

  Future<void> getFromApi() async{
    try {
      var httpClient = new HttpClient();
      var request = await httpClient.getUrl(Uri.parse('http://10.0.2.2:3000/api/omzets'));
      var response = await request.close();
      if (response.statusCode == HttpStatus.OK) {
        var json = await response.transform(UTF8.decoder).join();
        this.posts = Omzet.fromJsonArray(json);
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